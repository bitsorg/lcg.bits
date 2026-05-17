package: asiofi
description: asiofi FairMQ async transport based on Asio
version: "0.5.1"
tag: "0.5.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/asiofi-0.5.1.tar.gz
requires:
  - CMake
  - asio
  - ofi
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
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
    -DBUILD_SHARED_LIBS=ON
}
