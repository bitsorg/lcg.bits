package: mpfi
description: MPFI multiple-precision interval arithmetic library
version: "1.5.3"
tag: "1.5.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mpfi-1.5.3.tar.gz
requires:
  - gmp
  - mpfr
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
