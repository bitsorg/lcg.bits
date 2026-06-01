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
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DWITH_DD4HEP=ON
}
