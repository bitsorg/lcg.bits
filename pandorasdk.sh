package: pandorasdk
description: PandoraSDK software development kit for Pandora algorithms
version: "03.04.02"
tag: "03.04.02"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pandorasdk-03.04.02).tar.gz
requires:
  - pandorapfa
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
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
    -DCMAKE_MODULE_PATH=${pandorapfa_ROOT}/cmakemodules \
    -DCMAKE_CXX_FLAGS="-Wno-error"
}
