package: jsonc
description: jsonc JSON with comments C library
version: "0.17"
source: https://github.com/json-c/json-c
tag: "json-c-%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/json-c-0.17.tar.gz
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
