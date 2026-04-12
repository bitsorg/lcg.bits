package: garlic
description: garlic Key4hep framework package
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/garlic-HEAD.tar.gz
requires:
  - ilcutil
  - marlin
  - marlinutil
  - ROOT
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
