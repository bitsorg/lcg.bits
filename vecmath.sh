package: vecmath
description: Vecmath Java 3D vector math library (geometry utilities)
version: "master"
tag: "master"
source: https://github.com/root-project/vecmath.git
requires:
  - CMake
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
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -G \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER="" \
    -DCMAKE_C_FLAGS="$CFLAGS" \
    -DCMAKE_CXX_COMPILER="" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS"
}
