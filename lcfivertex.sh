package: lcfivertex
description: LCFIVertex vertex finder Marlin processor
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lcfivertex-HEAD.tar.gz
requires:
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
