package: libzip
description: libzip library/tool (from LCG software stack)
version: "1.9.2"
tag: "1.9.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libzip-1.9.2.tar.gz
requires:
  - zlib
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
    -DBUILD_SHARED_LIBS=ON
}
