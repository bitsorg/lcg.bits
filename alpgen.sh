package: alpgen
description: ALPGEN LO multi-parton matrix element generator
version: "2.1.4"
tag: "2.1.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/alpgen_v2.1.4.tgz
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - alpgen-2.1.4.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS} all
}
