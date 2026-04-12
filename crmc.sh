package: crmc
description: crmc Monte Carlo event generator
version: "2.0.1p5"
tag: "2.0.1p5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/crmc.v2.0.1p5.tar.gz
requires:
  - Boost
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - crmc-2.0.1p5.patch
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
    -DBOOST_ROOT=${Boost_ROOT} \
    -DBOOST_INCLUDE_DIR=${Boost_home_include} \
    -DBoost_NO_SYSTEM_PATHS=TRUE
}
