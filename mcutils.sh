package: mcutils
description: MCUtils Monte Carlo event analysis utilities
version: "1.4.0"
tag: "1.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/mcutils-1.4.0.tar.gz
requires:
  - heputils
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
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS}
  make install PREFIX=$INSTALLROOT
}
