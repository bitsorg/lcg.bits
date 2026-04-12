package: double_conversion
description: Binary-decimal and decimal-binary conversion routines for IEEE doubles
version: "3.1.5"
tag: "3.1.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/double-conversion-3.1.5.tar.gz
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
    -fPIC"
}
