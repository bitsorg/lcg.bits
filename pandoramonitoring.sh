package: pandoramonitoring
description: PandoraMonitoring monitoring and display for Pandora algorithms
version: "03.06.00"
tag: "03.06.00"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pandoramonitoring-03.06.00).tar.gz
requires:
  - ROOT
  - pandorasdk
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
    -DCMAKE_MODULE_PATH=${pandorapfa_ROOT}/cmakemodules \
    -Wno-error"
}
