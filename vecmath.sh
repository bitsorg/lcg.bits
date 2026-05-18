package: vecmath
description: Vecmath Java 3D vector math library (geometry utilities)
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/VecMath-HEAD.tar.gz
requires:
  - veccore
  - vdt
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
  cmake \
    -G \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER="" \
    -DCMAKE_C_FLAGS=$CFLAGS \
    -DCMAKE_CXX_COMPILER="" \
    -DCMAKE_CXX_FLAGS=$CXXFLAGS
}
