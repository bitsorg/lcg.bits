package: libuv
description: libuv library/tool (from LCG software stack)
version: "1.44.2"
tag: "1.44.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libuv-v1.44.2).tar.gz
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
