package: starlight
description: starlight Monte Carlo event generator
version: "r330"
tag: "r330"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/starlight-r330.tgz
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
    -Wno-array-parameter \
    -Wno-unused-but-set-variable \
    -Wno-unknown-warning-option" \
    -DCMAKE_INSTALL_LIBDIR=lib
}
