package: expat
description: Expat XML parsing library
version: "2.7.1"
tag: "2.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/expat-2.7.1.tar.bz2
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
    -DEXPAT_BUILD_DOCS=OFF
}
function Make() {
  make ${JOBS:+-j $JOBS} CFLAGS=-fPIC ELSE
}
