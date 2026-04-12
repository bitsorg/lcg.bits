package: tricktrack
description: tricktrack library/tool (from LCG software stack)
version: "1.0.9"
tag: "1.0.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/TrickTrack-1.0.9.tar.gz
requires:
  - eigen
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
