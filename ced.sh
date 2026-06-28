package: ced
description: CED (CEDViewer Event Display) for ILC experiments
version: "01.10"
tag: "v01-10"
source: https://github.com/iLCSoft/CED.git
requires:
  - CMake
  - ilcutil
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # TEMP (until bits-recipe-tools v0.0.32 is pinned): build out-of-source in a
  # SIBLING dir. ilcutil's GENERATE_PACKAGE_CONFIGURATION_FILES install step
  # cannot find the generated CEDLibDeps.cmake when the binary dir is nested
  # inside the source copy (CMakeRecipe v0.0.31). v0.0.32 makes the binary dir a
  # sibling in the framework; drop this line then.
  BITS_CMAKE_BUILD="../build"
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=ON \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
