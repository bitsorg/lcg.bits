package: mpfi
description: mpfi library/tool (from LCG software stack)
version: "1.5.3"
tag: "1.5.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mpfi-1.5.3.tar.gz
requires:
  - gmp
  - mpfr
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
