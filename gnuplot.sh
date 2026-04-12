package: gnuplot
description: gnuplot library/tool (from LCG software stack)
version: "6.0.4"
tag: "6.0.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gnuplot-6.0.4.tar.gz
  # optional:
  # - pango
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
