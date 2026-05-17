package: cppzmq
description: cppzmq header-only C++ ZeroMQ bindings
version: "4.8.1"
tag: "4.8.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cppzmq-4.8.1.tar.gz
requires:
  - zeromq
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--include"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCPPZMQ_BUILD_TESTS=OFF \
    -DCMAKE_BUILD_TYPE=Release
}
