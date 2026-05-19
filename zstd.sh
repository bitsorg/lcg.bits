package: zstd
description: Zstandard real-time lossless data compression library
version: "1.5.7"
tag: "1.5.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/zstd-1.5.7.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig --cmake"
##############################
