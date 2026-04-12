package: RooUnfold
description: RooUnfold library/tool (from LCG software stack)
version: "3.0.5"
tag: "3.0.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/RooUnfold-3.0.5.tar.gz
requires:
  - ROOT
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
    -DRooUnfoldTests=OFF \
    -DRooUnfoldGenerateCMakeConfig=ON
}
