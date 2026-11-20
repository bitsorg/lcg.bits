package: ponder
description: Ponder tool for documenting pandas DataFrames
version: "2.1.1"
source: https://github.com/billyquith/ponder
tag: "v%(version)s"
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
  # ponder's bundled tests fail under gcc 15 and we only need the library. The earlier
  # -DPONDER_BUILD_TEST/_DOC flags had wrong names; use ponder's real options
  # (BUILD_TEST, BUILD_TEST_EXAMPLES, BUILD_DOC) to actually skip them.
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
