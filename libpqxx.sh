package: libpqxx
description: libpqxx library/tool (from LCG software stack)
version: "7.10.1"
tag: "7.10.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libpqxx-7.10.1.zip
requires:
  - postgresql
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
    -DSKIP_BUILD_TEST=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_DOC=OFF \
    -DPostgreSQL_ROOT=${postgresql_ROOT} \
    -DCMAKE_CXX_STANDARD=17
}
