package: recola_SM_ATGC_WARSAW
description: recola_SM_ATGC_WARSAW Monte Carlo event generator
version: "2.2.4"
tag: "2.2.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/SM_ATGC_WARSAW_2.2.4.tar.gz
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
