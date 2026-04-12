package: geos
description: geos library/tool (from LCG software stack)
version: "3.7.2"
tag: "3.7.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/geos-3.7.2.tar.bz2
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
