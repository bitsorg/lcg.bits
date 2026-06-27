package: ponder
description: Ponder tool for documenting pandas DataFrames
version: "2.1.1"
tag: "2.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - Boost
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # The bundled pondertest/egtest targets fail to build under gcc 15; this stack
  # only needs the library. The previous -DPONDER_BUILD_TEST/-DPONDER_BUILD_DOC
  # flags had the wrong names (ponder's options are BUILD_TEST,
  # BUILD_TEST_EXAMPLES, BUILD_DOC), so tests were built anyway. Use the correct
  # option names to skip them.
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TEST=OFF \
    -DBUILD_TEST_EXAMPLES=OFF \
    -DBUILD_DOC=OFF \
    -DBUILD_TESTING=OFF \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS"
}
