package: cereal
description: Cereal C++11 header-only serialization library
version: "1.3.2"
tag: "1.3.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cereal-1.3.2.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
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
    -DBUILD_TESTS=OFF \
    -DCMAKE_DISABLE_FIND_PACKAGE_Boost=ON \
    -DJUST_INSTALL_CEREAL=ON
}
