package: libarchive
description: Multi-format archive and compression library
version: "3.8.7"
tag: "3.8.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libarchive-3.8.7.tar.gz
requires:
  - CMake
  - zlib
  - bzip2
  - LibLZMA
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
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
      -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_TEST=OFF \
    -DENABLE_INSTALL=ON \
    -DENABLE_LZMA=OFF \
    -DENABLE_BZip2=OFF \
    -DENABLE_ZLIB=OFF
}
