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
MODULE_OPTIONS="--inc"
##############################
function Configure() {
  cmake \
    -DCPPZMQ_BUILD_TESTS=OFF
}
