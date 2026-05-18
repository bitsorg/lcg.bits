package: highfive
description: HighFive header-only C++ HDF5 interface library
version: "2.10.1"
tag: "2.10.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/HighFive-2.10.1.tar.gz
requires:
  - Boost
  - hdf5
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSL-1.0
patches:
  - highfive-2.10.1.patch
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
    -DHIGHFIVE_EXAMPLES=FALSE \
    -DHIGHFIVE_UNIT_TESTS=FALSE
}
