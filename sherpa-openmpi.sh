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
  - openloops
  - pythia8
  - rivet
  - ROOT
  - lhapdf
  - libzip
  # mcfm is not yet ported to macOS (qcdloop needs GCC quadmath); gate the edge
  # so Linux still requires it and osx doesn't. See mcfm.sh.
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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# SWIG_LIB: prefer the relocated tree, since `swig -swiglib` reports the gone build
# INSTALLROOT on Linux too (surfaced once the el9 container stopped supplying a
# system swig); fall back to the binary for a system swig. Mirrors sherpa.sh.
export SWIG="${SWIG_ROOT}/bin/swig"
SWIG_LIB="$(ls -d "${SWIG_ROOT}"/share/swig/*/ 2>/dev/null | head -1)"
export SWIG_LIB="${SWIG_LIB:-$("${SWIG}" -swiglib 2>/dev/null)}"
export SWIG_LIB="${SWIG_LIB%/}"
# Put OpenMPI's compilers on PATH so find_package(MPI) finds mpicxx. FindMPI also runs a
# compile+link test (MPI_*_WORKS); the relocated wrappers need OPAL_PREFIX to find their
# plugins/config, or the test fails ("Could NOT find MPI").
export PATH="${OPENMPI_ROOT}/bin:${PATH}"
export OPAL_PREFIX="${OPENMPI_ROOT}"
##############################
function Configure() {
  # Sherpa 3 (CMake) with the MPI backend; otherwise identical to the plain sherpa recipe.
  # MCFM is gated off on macOS, so when MCFM_ROOT is unset disable it; on Linux MCFM_ROOT
  # is set -> _mcfm=ON.
  local _mcfm=OFF; [ -n "${MCFM_ROOT:-}" ] && _mcfm=ON
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DSHERPA_ENABLE_MPI=ON \
    -DSHERPA_ENABLE_TESTING=OFF \
    -DSHERPA_ENABLE_MANUAL=OFF \
    -DSHERPA_ENABLE_LHOLE=ON \
    -DSHERPA_ENABLE_LHAPDF=ON \
    -DSHERPA_ENABLE_OPENLOOPS=ON \
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
