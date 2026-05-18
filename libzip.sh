package: libzip
description: libzip library for reading, creating and modifying ZIP archives
version: "1.9.2"
tag: "1.9.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libzip-1.9.2.tar.gz
requires:
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
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake \
    -DBUILD_SHARED_LIBS=ON
}
