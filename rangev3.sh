package: rangev3
description: Range library for C++14/17/20 (Eric Niebler's range-v3)
version: "0.12.0"
tag: "0.12.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rangev3-0.12.0.tgz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--include"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_COMPILER=$CXX \
    -DCMAKE_CXX_FLAGS=$CXXFLAGS \
    -DBUILD_TESTING=OFF \
    -DRANGE_V3_TESTS=OFF \
    -DRANGE_V3_DOCS=OFF \
    -DRANGE_V3_EXAMPLES=OFF \
    -DRANGE_V3_PERF=OFF
}
