package: mpfr
description: GNU MPFR multiple-precision floating-point arithmetic library
version: "4.2.1"
tag: "4.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mpfr-4.2.1.tar.gz
requires:
  - gmp
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
