package: lcfivertex
description: LCFIVertex vertex finder Marlin processor
version: "master"
tag: "master"
source: https://github.com/iLCSoft/LCFIVertex.git
requires:
  - CMake
  - LCIO
  - ilcutil
  - Boost
  - marlin
  - marlinutil
  - raida
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
