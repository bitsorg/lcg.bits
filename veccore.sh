package: veccore
description: VecCore C++ header-only SIMD abstraction library (CERN)
version: "0.8.2"
tag: "0.8.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/VecCore-0.8.2.tar.gz
requires:
  - CMake
  - umesimd
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
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF
}
