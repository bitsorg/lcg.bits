package: sherpa-openmpi
description: Sherpa Monte Carlo event generator built with OpenMPI
version: "3.0.3.openmpi3"
mem_per_job: 1500
tag: "3.0.3.openmpi3"
sources:
  # ".openmpi3" is a build label, not part of the upstream filename — same
  # source tarball as the regular sherpa recipe; MPI is enabled at build time.
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/sherpa-v3.0.3.tar.gz
requires:
  - CMake
  - Python
  - swig
  - openmpi
  # Gated behind the `openloops` flavour (off by default); see sherpa.sh.
  - "openloops:(?openloops)"
  - pythia8
  - rivet
  - ROOT
  - lhapdf
  - libzip
  # mcfm is not yet ported to macOS (qcdloop needs GCC quadmath); gate the edge.
  - "mcfm:(?!osx)"
  - hepmc3
  - fastjet
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
export SWIG="${SWIG_ROOT}/bin/swig"
# macOS: `swig -swiglib` reports swig's build-time INSTALLROOT path, which no
# longer exists after relocation, so swig cannot find its library files at the
# final wrapper-generation stage ("Unable to find 'swig.swg' / 'python.swg' /
# 'std_vector.i'"). Use the relocated swiglib under SWIG_ROOT instead. Linux
# keeps its working `swig -swiglib`. (Same fix as apfel/sherpa.)
if [ "$(uname)" = Darwin ]; then
  _swigdir=$(ls -d "${SWIG_ROOT}"/share/swig/*/ 2>/dev/null | head -1)
  export SWIG_LIB="${_swigdir%/}"
else
  export SWIG_LIB="$(${SWIG_ROOT}/bin/swig -swiglib 2>/dev/null)"
fi
# Put OpenMPI's compilers on PATH so Sherpa's find_package(MPI) locates mpicxx.
# PATH alone isn't enough: FindMPI also runs a compile+link test (MPI_*_WORKS),
# and the relocated mpicc/mpicxx/mpifort wrappers can't find their plugins/config
# without OPAL_PREFIX, so the test fails ("Could NOT find MPI ... MPI_*_WORKS").
export PATH="${OPENMPI_ROOT}/bin:${PATH}"
export OPAL_PREFIX="${OPENMPI_ROOT}"
##############################
function Configure() {
  # Sherpa 3 (CMake) with the MPI backend enabled. Otherwise identical to the
  # plain sherpa recipe; see sherpa.sh.
  # OpenLoops is gated behind the `openloops` flavour. When it is off the
  # dependency is dropped and OPENLOOPS_ROOT is unset, so disable it in CMake.
  # (Passing an empty -DSHERPA_ENABLE_OPENLOOPS= makes Sherpa's ConfigLogger.cmake
  # fail: `if( STREQUAL "ON")` -> "Unknown arguments".)
  local _ol=OFF; [ -n "${OPENLOOPS_ROOT:-}" ] && _ol=ON
  # MCFM is gated off on macOS (qcdloop needs GCC quadmath); disable it when the
  # edge is dropped (MCFM_ROOT unset).
  local _mcfm=OFF; [ -n "${MCFM_ROOT:-}" ] && _mcfm=ON
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DSHERPA_ENABLE_MPI=ON \
    -DSHERPA_ENABLE_TESTING=OFF \
    -DSHERPA_ENABLE_MANUAL=OFF \
    -DSHERPA_ENABLE_LHOLE=ON \
    -DSHERPA_ENABLE_LHAPDF=ON \
    -DSHERPA_ENABLE_OPENLOOPS=$_ol \
    -DSHERPA_ENABLE_PYTHIA8=ON \
    -DSHERPA_ENABLE_PYTHON=ON \
    -DPython_ROOT_DIR="${PYTHON_ROOT}" \
    -DPython_EXECUTABLE="${PYTHON_ROOT}/bin/python3" \
    -DSHERPA_ENABLE_RIVET=ON \
    -DSHERPA_ENABLE_ROOT=ON \
    -DSHERPA_ENABLE_UFO=ON \
    -DSHERPA_ENABLE_BINRELOC=ON \
    -DSHERPA_ENABLE_ANALYSIS=ON \
    -DSHERPA_ENABLE_EWSUD=ON \
    -DSHERPA_ENABLE_MCFM=$_mcfm \
    ${MCFM_ROOT:+-DMCFM_ROOT_DIR="${MCFM_ROOT}"} \
    -DSHERPA_ENABLE_HEPMC3=ON \
    -DSHERPA_ENABLE_HEPMC3_ROOT=ON
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv SHERPA_INSTALL_PATH $PKG_ROOT/lib/SHERPA-MC
setenv SHERPA_SHARE_PATH $PKG_ROOT/share/SHERPA-MC
EOF
}
