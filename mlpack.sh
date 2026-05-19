package: mlpack
description: mlpack fast and flexible C++ machine learning library
version: "4.6.2"
tag: "4.6.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mlpack-4.6.2.tar.gz
requires:
  - CMake
  - armadillo
  - cereal
  - ensmallen
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTS=OFF
}
