package: spdlog
description: spdlog fast C++ logging library, header-only or compiled
version: "1.15.0"
tag: "1.15.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/spdlog-1.15.0.tar.gz
build_requires:
  - bits-recipe-tools
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
    -DCMAKE_CXX_FLAGS=$CXXFLAGS
}
