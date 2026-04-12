package: ccache
description: Compiler cache to speed up recompilation
version: "4.13.2"
tag: "4.13.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ccache-4.13.2.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_TESTING=OFF
}
