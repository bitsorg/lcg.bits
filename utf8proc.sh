package: utf8proc
description: utf8proc C library for processing and validating UTF-8 text
version: "2.10.0"
tag: "2.10.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/utf8proc-2.10.0.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
