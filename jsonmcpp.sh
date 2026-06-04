package: jsonmcpp
description: jsonmcpp JSON manipulation C++ library
version: "3.12.0"
tag: "3.12.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/json-3.12.0.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DJSON_MultipleHeaders=ON \
    -DJSON_BuildTests=OFF
}
