package: assimp
description: Open Asset Import Library for 3D model formats
version: "6.0.5"
tag: "v6.0.5"
source: https://github.com/assimp/assimp
requires:
  - CMake
  - Boost
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
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="-Wno-tautological-compare -Wno-sizeof-pointer-memaccess" \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_SHARED_LIBS=1 \
    -DASSIMP_BUILD_TESTS=OFF \
    -DIGNORE_GIT_HASH=ON \
    -DBoost_NO_BOOST_CMAKE=ON
}
