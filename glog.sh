package: glog
description: Google C++ logging library
version: "0.4.0"
tag: "0.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/glog-0.4.0.tar.gz
requires:
  - gflags
build_requires:
  - bits-recipe-tools
license: TODO
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
    -DCMAKE_CXX_FLAGS=$CXXFLAGS \
    -DBUILD_SHARED_LIBS=ON
}
