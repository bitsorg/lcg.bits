package: gnuplot
description: Gnuplot portable interactive data and function plotting utility
version: "6.0.4"
tag: "6.0.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gnuplot-6.0.4.tar.gz
  # optional:
  # - pango
build_requires:
  - bits-recipe-tools
license: LicenseRef-gnuplot
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
