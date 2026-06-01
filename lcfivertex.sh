package: lcfivertex
description: LCFIVertex vertex finder Marlin processor
version: "HEAD"
tag: "HEAD"
source: git+https://github.com/iLCSoft/LCFIVertex.git?obj=master
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
