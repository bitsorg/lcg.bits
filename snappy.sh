package: snappy
description: Fast compressor/decompressor (Snappy)
version: "1.1.7"
tag: "1.1.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/snappy-1.1.7.tar.gz
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
    -DCMAKE_CXX_COMPILER=$CXX \
    -fPIC" \
    -DSNAPPY_BUILD_TESTS=OFF \
    -DBUILD_SHARED_LIBS=ON
}
