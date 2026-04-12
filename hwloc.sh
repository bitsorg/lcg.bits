package: hwloc
description: hwloc library/tool (from LCG software stack)
version: "2.7.0"
tag: "2.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hwloc-2.7.0.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
