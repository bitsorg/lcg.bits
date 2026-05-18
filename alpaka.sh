package: alpaka
description: Alpaka abstraction library for parallel kernel acceleration
version: "2.1.1"
tag: "2.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/alpaka-2.1.1.tar.gz
requires:
  - Boost
  - tbb
  # optional:
  # - cuda
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MPL-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--inc"
##############################
function Configure() {
  cmake \
    -DCMAKE_CXX_COMPILER=$CXX \
    -DCMAKE_CXX_STANDARD=17
}
