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
  # Previously this passed a bare "-G" (no generator -> CMake error) plus empty
  # -DCMAKE_C_COMPILER=""/-DCMAKE_CXX_COMPILER="" (which broke compiler
  # detection). Use CMake's default generator and let bits' toolchain set the
  # compilers.
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17
}
