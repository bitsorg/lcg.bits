package: acts
description: ACTS track reconstruction framework for HEP experiments
version: "26.0.0"
tag: "26.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/acts-26.0.0.tar.gz
requires:
  - Boost
  - eigen
  - ROOT
  - DD4hep
build_requires:
  - bits-recipe-tools
license: MPL-2.0
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
    -DACTS_BUILD_PLUGIN_IDENTIFICATION=ON \
    -DACTS_BUILD_PLUGIN_DIGITIZATION=ON \
    -DACTS_BUILD_PLUGIN_DD4HEP=ON \
    -DACTS_BUILD_PLUGIN_JSON=ON \
    -DACTS_BUILD_PLUGIN_TGEO=ON \
    -DACTS_BUILD_UNITTESTS=OFF \
    -DACTS_USE_SYSTEM_LIBS=ON \
    -I${XercesC_ROOT}/include \
    -I${eigen_ROOT}/include/eigen3"
}
