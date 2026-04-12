package: brotli
description: Brotli lossless data compression algorithm
version: "1.0.7"
tag: "1.0.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/brotli-1.0.7.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - brotli-1.0.7.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
