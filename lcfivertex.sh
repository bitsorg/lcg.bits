package: lcfivertex
description: lcfivertex Key4hep framework package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
