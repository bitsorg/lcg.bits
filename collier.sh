package: collier
description: collier Monte Carlo event generator
version: "1.2.8"
tag: "1.2.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/collier-1.2.8.tar.gz
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
    -Dstatic=OFF \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
}
function Make() {
  make -j1 install COMMAND cmake -DCMAKE_INSTALL_PREFIX=$INSTALLROOT -DCMAKE_BUILD_TYPE=Release -Dstatic=ON -DCMAKE_POSITION_INDEPENDENT_CODE=ON $SOURCEDIR
}
