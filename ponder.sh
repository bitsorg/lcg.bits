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
  # The bundled pondertest target fails to build; this stack only needs the
  # library, so disable the tests (and docs).
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DPONDER_BUILD_TEST=OFF \
    -DPONDER_BUILD_DOC=OFF \
    -DBUILD_TESTING=OFF \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS"
}
