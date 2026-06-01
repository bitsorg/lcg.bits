package: marlinmlflavortagging
description: MarlinML ML-based flavor tagging for ILC
version: "HEAD"
tag: "HEAD"
source: git+https://gitlab.desy.de/ilcsoft/MarlinMLFlavorTagging.git?obj=main
requires:
  - CMake
  - LCIO
  - ilcutil
  - lcfivertex
  - marlin
  - ROOT
  - torch
  - AIDA
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
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
