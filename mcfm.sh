package: mcfm
description: MCFM Monte Carlo for FeMtobarn processes
version: "10.3.atlas"
tag: "10.3.atlas"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/MCFM-10.3.atlas.tar.gz
requires:
  - lhapdf
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
    -Duse_internal_lhapdf=OFF \
    -Dlhapdf_include_path=${lhapdf_ROOT}/include \
    -Dwith_library=ON
}
function Make() {
  make ${JOBS:+-j $JOBS} -j4
}
