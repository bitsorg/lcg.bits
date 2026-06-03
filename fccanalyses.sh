package: fccanalyses
description: FCCAnalyses analysis framework for FCC experiments
version: "0.12.0"
tag: "v0.12.0"
source: https://github.com/HEP-FCC/FCCAnalyses.git
requires:
  - CMake
  - EDM4hep
  - k4fwcore
  - fastjet
  - eigen
  - DD4hep
  - delphes
  - vdt
  # optional:
  # - onnxruntime
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # FCCAnalyses' FindDelphes.cmake reaches the bundled TrackCovariance headers
  # (TrkUtil.h, one dir deeper than the suffix search) only via $DELPHES_DIR.
  # bits exports DELPHES_ROOT to the build env (not DELPHES_DIR, and the
  # delphes modulefile's setenv only applies at runtime, not at build time), so
  # map it here. Without this: "missing DELPHES_EXTERNALS_TKCOV_INCLUDE_DIR".
  export DELPHES_DIR="${DELPHES_ROOT}"
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=20 \
    -DWITH_DD4HEP=ON
}
