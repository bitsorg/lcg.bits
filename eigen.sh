package: eigen
description: eigen header-only C++ template library for linear algebra
version: "3.4.1"
tag: "3.4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
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
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
    -DCMAKE_BUILD_TYPE=Release \
    -DEIGEN_BUILD_DOC=OFF \
    -DBUILD_TESTING=OFF
}
