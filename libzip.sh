package: libzip
description: libzip library for reading, creating and modifying ZIP archives
version: "1.9.2"
tag: "1.9.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libzip-1.9.2.tar.gz
requires:
  - CMake
  - zlib
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON
}
