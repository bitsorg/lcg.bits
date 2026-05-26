package: libuv
description: libuv cross-platform asynchronous I/O library
version: "1.44.2"
tag: "1.44.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libuv-v1.44.2.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
prepend_path:
  PKG_CONFIG_PATH: "$LIBUV_ROOT/lib/pkgconfig"
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig --cmake"
##############################
