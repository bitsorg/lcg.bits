package: absl
description: Abseil common C++ library collection (Google)
version: "20230802.1"
tag: "20230802.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/abseil-cpp-20230802.1.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - absl-20230802.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DABSL_BUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DABSL_ENABLE_INSTALL=ON \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_SHARED_LIBS=ON
}
