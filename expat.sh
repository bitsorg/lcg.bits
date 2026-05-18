package: expat
description: Expat XML parsing library
version: "2.7.1"
tag: "2.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/expat-2.7.1.tar.bz2
prefer_system: ".*"
prefer_system_check:

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake \
    -DEXPAT_BUILD_DOCS=OFF \
    -DCMAKE_C_FLAGS=-fPIC
}
function Make() {
  cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
}
