package: flatbuffers
description: Memory-efficient cross-platform serialization library
version: "25.2.10"
tag: "25.2.10"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/flatbuffers-25.2.10.tar.gz
requires:
  - CMake
  - numpy
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --inc --cmake"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DFLATBUFFERS_INSTALL=ON \
    -DFLATBUFFERS_BUILD_FLATLIB=ON \
    -DFLATBUFFERS_BUILD_FLATC=ON \
    -DFLATBUFFERS_BUILD_TESTS=OFF \
    -Wno-int-conversion \
    -Wno-unused-but-set-variable
}
