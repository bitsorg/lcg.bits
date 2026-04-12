package: bear
description: bear library/tool (from LCG software stack)
version: "3.1.5"
tag: "3.1.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/bear-3.1.5.tar.gz
requires:
  - jsonmcpp
  - grpc
  - spdlog
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DENABLE_UNIT_TESTS=OFF \
    -DENABLE_FUNC_TESTS=OFF
}
