package: marlintrk
description: MarlinTrk track fitting framework for Marlin
version: "HEAD"
tag: "HEAD"
source: git+https://github.com/iLCSoft/MarlinTrk.git?obj=master
requires:
  - CMake
  - LCIO
  - ilcutil
  - marlin
  - ROOT
  - kaltest
  - kaldet
  - GSL
  - clhep
  - generalbrokenlines
  - aidatt
  - ddkaltest
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
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
