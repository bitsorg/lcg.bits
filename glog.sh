package: glog
description: Google glog C++ application-level logging library
version: "0.4.0"
tag: "0.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/glog-0.4.0.tar.gz
requires:
  - gflags
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
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
    -DBUILD_SHARED_LIBS=ON
}
