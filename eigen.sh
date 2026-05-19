package: eigen
description: eigen header-only C++ template library for linear algebra
version: "3.4.1"
tag: "3.4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/eigen-3.4.1.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MPL-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--inc --cmake"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER="" \
    -DCMAKE_CXX_COMPILER=""
}
