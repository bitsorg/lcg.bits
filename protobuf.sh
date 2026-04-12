package: protobuf
description: Google Protocol Buffers serialization library
version: "5.28.3"
tag: "5.28.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/protobuf-all-5.28.3.tar.gz
requires:
  - Python
  - setuptools
  - absl
  - zlib
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
patches:
  - protobuf-5.28.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -Dprotobuf_BUILD_SHARED_LIBS=OFF \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -Dprotobuf_BUILD_TESTS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DABSL_PROPAGATE_CXX_STD=ON \
    -Dprotobuf_ABSL_PROVIDER=package \
    --prefix=$INSTALLROOT
}
