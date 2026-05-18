package: ponder
description: Ponder tool for documenting pandas DataFrames
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ponder-unknown.tar.gz
requires:
  - Boost
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
    -DCMAKE_CXX_FLAGS=$CXXFLAGS
}
