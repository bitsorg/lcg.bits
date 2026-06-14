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
  # The bundled pondertest/egtest targets fail under gcc15; this stack only needs
  # the library. Skip them via ponder's real option names: BUILD_TEST,
  # BUILD_TEST_EXAMPLES, BUILD_DOC (the PONDER_BUILD_* names were wrong).
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TEST=OFF \
    -DBUILD_TEST_EXAMPLES=OFF \
    -DBUILD_DOC=OFF \
    -DBUILD_TESTING=OFF \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS"
}
