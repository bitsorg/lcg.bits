package: gperf
description: GNU gperf perfect hash function generator
version: "3.1"
tag: "3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gperf-3.1.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - gperf-3.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
