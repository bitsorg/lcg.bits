package: bear
description: Bear tool that generates a compile_commands.json database
version: "3.1.5"
tag: "3.1.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/bear-3.1.5.tar.gz
requires:
  - jsonmcpp
  - grpc
  - spdlog
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DENABLE_UNIT_TESTS=OFF \
    -DENABLE_FUNC_TESTS=OFF
}
