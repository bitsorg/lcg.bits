package: c_ares
description: c-ares asynchronous DNS resolver library
version: "1.34.3"
tag: "1.34.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/c-ares-1.34.3.tar.gz
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
