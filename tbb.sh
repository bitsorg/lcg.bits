package: tbb
description: Intel Threading Building Blocks parallel programming library
version: "2022.2.0"
tag: "2022.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tbb2022.2.0oss_src.tgz
build_requires:
  - bits-recipe-tools
license: Apache-2.0
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
    -DTBB_TEST=OFF
}
function Make() {
  make ${JOBS:+-j $JOBS} ${tbb_build_options}
}
