package: k4geo
description: Key4hep detector geometry descriptions (DD4hep)
version: "00.24"
tag: "v00-24"
source: https://github.com/key4hep/k4geo.git
requires:
  - CMake
  - DD4hep
  - EDM4hep
  - LCIO
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
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DINSTALL_COMPACT_FILES=ON \
    -DINSTALL_BEAMPIPE_STL_FILES=ON \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
