package: thrift
description: Apache Thrift scalable cross-language RPC framework
version: "0.16.0"
tag: "0.16.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/thrift-0.16.0.tar.gz
requires:
  - pkg_config
  - Boost
  - bison
  - flex
build_requires:
  - bits-recipe-tools
license: Apache-2.0
patches:
  - thrift-0.16.0.patch
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
    -DCMAKE_C_FLAGS="-fPIC" \
    -DCMAKE_CXX_FLAGS="-fPIC" \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=OFF \
    -DBUILD_TUTORIALS=OFF \
    -DWITH_C_GLIB=OFF \
    -DWITH_JAVA=OFF \
    -DWITH_PYTHON=OFF \
    -DWITH_NODEJS=OFF \
    -DWITH_JAVASCRIPT=OFF \
    -DWITH_CPP=ON \
    -DWITH_STATIC_LIB=ON \
    -DWITH_LIBEVENT=OFF \
    -DBoost_NO_BOOST_CMAKE=ON
}
