package: lz4
description: Extremely fast lossless compression algorithm and library
version: "1.10.0"
tag: "1.10.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lz4-1.10.0.tar.gz
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
