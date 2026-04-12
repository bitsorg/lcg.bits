package: recola
description: recola Monte Carlo event generator
version: "2.2.4.atlas1"
tag: "2.2.4.atlas1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/recola2-2.2.4.atlas1.tar.gz
requires:
  - collier
  - recola_SM
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - recola-2.2.4.atlas1.patch
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
    -Dmodel=SM \
    -Dmodelfile_path=${recola_SM_ROOT}/lib/cmake \
    -Dwith_python3=ON \
    -Dstatic=OFF \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
}
function Make() {
  make ${JOBS:+-j $JOBS} install
}
