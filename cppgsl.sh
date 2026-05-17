package: cppgsl
description: Microsoft C++ Guidelines Support Library (GSL) headers
version: "4.2.0"
tag: "4.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cppgsl-4.2.0.tar.gz
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
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DGSL_TEST=OFF
}
