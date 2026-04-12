package: eigen
description: eigen library/tool (from LCG software stack)
version: "3.4.1"
tag: "3.4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/eigen-3.4.1.tar.gz
build_requires:
  - bits-recipe-tools
license: MPL-2.0
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
    -DCMAKE_C_COMPILER="" \
    -DCMAKE_CXX_COMPILER=""
}
