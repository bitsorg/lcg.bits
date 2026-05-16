package: hwloc
description: hwloc hardware locality library for topology discovery
version: "2.7.0"
tag: "2.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hwloc-2.7.0.tar.gz
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
