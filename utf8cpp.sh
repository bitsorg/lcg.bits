package: utf8cpp
description: utf8cpp library/tool (from LCG software stack)
version: "3.2.3"
tag: "3.2.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/utf8cpp-3.2.3.tar.gz
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
    -DCMAKE_CXX_COMPILER="" \
    -DUTF8_TESTS=OFF
}
