package: googletest
description: Google C++ testing and mocking framework (gtest/gmock)
version: "1.16.0"
tag: "1.16.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/googletest-1.16.0.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
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
    -DCMAKE_C_COMPILER=$CC \
    -DCMAKE_CXX_COMPILER=$CXX \
    -Dgtest_build_samples=ON
}
