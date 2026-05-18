package: jsonmcpp
description: jsonmcpp JSON manipulation C++ library
version: "3.12.0"
tag: "3.12.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/json-3.12.0.tar.gz
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
  cmake \
    -DCMAKE_CXX_COMPILER=$CXX \
    -DCMAKE_CXX_FLAGS=$CXXFLAGS \
    -DJSON_MultipleHeaders=ON \
    -DJSON_BuildTests=OFF
}
