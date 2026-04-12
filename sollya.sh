package: sollya
description: sollya library/tool (from LCG software stack)
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
license: TODO
patches:
  - sollya-8.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
