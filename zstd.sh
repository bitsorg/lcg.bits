package: zstd
description: Zstandard fast real-time compression algorithm
version: "1.5.7"
tag: "1.5.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/zstd-1.5.7.tar.gz
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
