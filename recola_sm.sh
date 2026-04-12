package: recola_SM
description: recola_SM Monte Carlo event generator
version: "2.2.3"
tag: "2.2.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/recola_SM_2.2.3.tar.gz
requires:
  - collier
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
    -Dcollier_path=${collier_ROOT}/lib \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -Dstatic=OFF \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
}
