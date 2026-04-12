package: jsonc
description: jsonc library/tool (from LCG software stack)
version: "0.17"
tag: "0.17"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/json-c-0.17.tar.gz
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
