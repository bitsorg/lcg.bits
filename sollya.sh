package: sollya
description: Sollya environment for safe floating-point code development
version: "8.0"
tag: "8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sollya-8.0.tar.bz2
requires:
  - gmp
  - mpfr
  - mpfi
  - libxml2
  - fplll
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
patches:
  - sollya-8.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
