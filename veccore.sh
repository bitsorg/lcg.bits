package: veccore
description: VecCore C++ header-only SIMD abstraction library (CERN)
version: "0.8.2"
tag: "0.8.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/VecCore-0.8.2.tar.gz
requires:
  - umesimd
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -G \
    -DBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER="" \
    -DCMAKE_C_FLAGS=$CFLAGS \
    -DCMAKE_CXX_COMPILER="" \
    -DCMAKE_CXX_FLAGS=$CXXFLAGS
}
