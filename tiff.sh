package: tiff
description: tiff library/tool (from LCG software stack)
version: "4.7.0"
tag: "4.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tiff-4.7.0.tar.gz
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
    --prefix
}
