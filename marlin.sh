package: marlin
description: Marlin modular analysis and reconstruction framework for ILC
version: "01.19.06"
tag: "v01-19-06"
source: https://github.com/iLCSoft/marlin.git
requires:
  - CMake
  - LCIO
  - ilcutil
  - gear
  - lccd
  - raida
  # Marlin's CMake has OPTION(MARLIN_CLHEP ... ON) and FIND_PACKAGE(CLHEP),
  # SEND_ERROR-ing if absent, so CLHEP must be in the build closure.
  - clhep
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
  # MARLIN_AIDA must stay ON: MarlinConfig.h does `#cmakedefine MARLIN_AIDA` and
  # AIDAProcessor.h gates the class on it, so AIDA OFF compiles it out for every
  # consumer. Marlin's FIND_PACKAGE(AIDA) uses config mode - point AIDA_DIR at RAIDA's AIDAConfig.cmake.
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DMARLIN_AIDA=ON \
    -DAIDA_DIR="${RAIDA_ROOT}/lib/cmake/RAIDA" \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
