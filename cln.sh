package: cln
description: Class Library for Numbers (CLN) arbitrary precision arithmetic
version: "1.3.7"
tag: "1.3.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cln-1.3.7.tar.bz2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
