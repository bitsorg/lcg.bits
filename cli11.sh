package: cli11
description: cli11 library/tool (from LCG software stack)
version: "2.4.2"
tag: "2.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/CLI11-2.4.2.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--include"
##############################
