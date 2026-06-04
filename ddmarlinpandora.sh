package: ddmarlinpandora
description: DDMarlinPandora Pandora PFA plugin for DD4hep/Marlin
version: "00.14"
tag: "v00-14"
source: https://github.com/iLCSoft/DDMarlinPandora.git
requires:
  - CMake
  - ilcutil
  - marlin
  - marlinutil
  - marlintrk
  - pandorasdk
  - pandorapfa
  - pandoramonitoring
  - lccontent
  - larcontent
  - DD4hep
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
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DPANDORA_MONITORING=ON \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
