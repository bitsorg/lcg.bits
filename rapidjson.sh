package: rapidjson
description: Fast C++ JSON parser and generator library
version: "1.1.0"
tag: "1.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rapidjson-1.1.0.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - rapidjson-1.1.0.patch
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
    -DRAPIDJSON_BUILD_DOC=OFF \
    -DRAPIDJSON_BUILD_EXAMPLES=OFF \
    -DRAPIDJSON_BUILD_TESTS=OFF
}
