package: simdjson
description: simdjson JSON parser using SIMD instructions
version: "3.1.1"
tag: "3.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/simdjson-3.1.1.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
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
    -DCMAKE_CXX_COMPILER="$CXX" \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    -DSIMDJSON_JUST_LIBRARY=ON
}
