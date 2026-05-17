package: vectorclass
description: Agner Fog's Vector Class Library for SIMD programming
version: "2.01.02"
tag: "2.01.02"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/vectorclass-2.01.02.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--include"
##############################
