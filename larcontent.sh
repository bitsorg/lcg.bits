package: larcontent
description: LArContent Liquid Argon TPC reconstruction algorithms for Pandora
version: "04.11.02"
tag: "04.11.02"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/larcontent-04.11.02).tar.gz
requires:
  - pandorapfa
  - pandorasdk
  - pandoramonitoring
  - eigen
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
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DPANDORA_MONITORING=ON \
    -DCMAKE_MODULE_PATH=${pandorapfa_ROOT}/cmakemodules \
    -Wno-error"
}
