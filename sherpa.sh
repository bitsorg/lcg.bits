package: sherpa
description: Sherpa multi-purpose Monte Carlo event generator
version: "3.0.3"
mem_per_job: 1500
tag: "3.0.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/sherpa-v3.0.3.tar.gz
requires:
  - CMake
  - Python
  - swig
  # openloops is a heavy one-loop provider; gate it behind the `openloops`
  # flavour so it is only pulled in (and only built) with `--flavour openloops`.
  # Off by default on every platform; Sherpa builds fine without it.
  - "openloops:(?openloops)"
  - pythia8
  - rivet
  - ROOT
  - lhapdf
  - libzip
  - mcfm
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
# Sherpa 3 builds Python bindings with SWIG; lcgcmake passes SWIG/SWIG_LIB to
# both configure and make, so set them at recipe scope.
export SWIG="${SWIG_ROOT}/bin/swig"
export SWIG_LIB="$(${SWIG_ROOT}/bin/swig -swiglib 2>/dev/null)"
##############################
function Configure() {
  # Sherpa 3.x switched from autotools to CMake. Flags mirror lcgcmake's
  # sherpa>=3 build. C++17 even on a C++20 stack (lcgcmake forces 17 here).
  # OpenLoops is gated behind the `openloops` flavour. When it is off the
  # dependency is dropped and OPENLOOPS_ROOT is unset, so disable it in CMake.
  local _ol=OFF; [ -n "${OPENLOOPS_ROOT:-}" ] && _ol=ON
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
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
    -DSHERPA_ENABLE_MCFM=ON \
    -DMCFM_ROOT_DIR="${MCFM_ROOT}" \
    -DSHERPA_ENABLE_HEPMC3=ON \
    -DSHERPA_ENABLE_HEPMC3_ROOT=ON
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv SHERPA_INSTALL_PATH $PKG_ROOT/lib/SHERPA-MC
setenv SHERPA_SHARE_PATH $PKG_ROOT/share/SHERPA-MC
EOF
}
