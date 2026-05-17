package: ginac
description: GiNaC open framework for symbolic computation
version: "1.8.7"
tag: "1.8.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ginac-1.8.7.tar.bz2
requires:
  - cln
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
