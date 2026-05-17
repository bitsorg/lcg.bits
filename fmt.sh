package: fmt
description: Modern C++ string formatting library ({fmt})
version: "10.2.1"
tag: "10.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fmt-10.2.1.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
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
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_COMPILER=$CXX \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_FLAGS=$CXXFLAGS \
    -DBUILD_SHARED_LIBS=TRUE
}
