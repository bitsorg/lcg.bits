package: libarchive
description: libarchive library/tool (from LCG software stack)
version: "3.7.9"
tag: "3.7.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libarchive-3.7.9.tar.gz
requires:
  - zlib
  - bzip2
  - LibLZMA
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
    -DENABLE_TEST=OFF \
    -DENABLE_INSTALL=ON \
    -DENABLE_LZMA=OFF \
    -DENABLE_BZip2=OFF \
    -DENABLE_ZLIB=OFF
}
