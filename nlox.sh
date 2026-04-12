package: nlox
description: NLox NLO QCD library for loop amplitudes
version: "1.2.2.atlas7"
tag: "1.2.2.atlas7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/nlox-1.2.2.atlas7.tar.gz
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
function Make() {
  $SHELL -c " sed -i \ -e 's/set(NLOX_PROCESSES [^)]*
  make ${JOBS:+-j $JOBS}
  make install
}