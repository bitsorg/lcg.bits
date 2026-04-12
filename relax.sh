package: RELAX
description: RELAX library/tool (from LCG software stack)
version: "6.1.2"
tag: "6.1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/RELAX-6.1.2).tar.gz
requires:
  - cmaketools
  - ROOT
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
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_MODULE_PATH=${CMAKETOOLS_MODULES} \
    -DCMAKE_CXX_FLAGS=$CXXFLAGS
}
function Make() {
  make ${JOBS:+-j $JOBS} ROOTSYS=${ROOT_ROOT}
}
