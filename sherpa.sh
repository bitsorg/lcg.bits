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
# Sherpa 3 builds Python bindings with SWIG; lcgcmake passes SWIG/SWIG_LIB to
# both configure and make, so set them at recipe scope. bits_swig_lib returns
# the relocated swiglib on macOS (identical to `swig -swiglib` on Linux).
export SWIG="${SWIG_ROOT}/bin/swig"
export SWIG_LIB="$(bits_swig_lib)"
##############################
function Configure() {
  # Sherpa 3.x switched from autotools to CMake. Flags mirror lcgcmake's
  # sherpa>=3 build. C++17 even on a C++20 stack (lcgcmake forces 17 here).
  # MCFM is gated off on macOS (see mcfm.sh); when its edge is dropped MCFM_ROOT
  # is unset, so disable it here. On Linux MCFM_ROOT is set -> _mcfm=ON (as before).
  local _mcfm=OFF; [ -n "${MCFM_ROOT:-}" ] && _mcfm=ON
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
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
