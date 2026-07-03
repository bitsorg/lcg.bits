package: vecmath
description: Vecmath Java 3D vector math library (geometry utilities)
version: "master"
tag: "master"
source: https://github.com/root-project/vecmath.git
requires:
  - CMake
  - veccore
  - "vdt:(?!osx)"
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
  # Use CMake's default generator and let bits' toolchain set the compilers
  # (a bare "-G" and empty -DCMAKE_*_COMPILER="" broke generator/compiler detection).
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17
}
