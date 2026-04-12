package: crmcold
description: crmcold Monte Carlo event generator
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/crmc-unknown.tar.gz
requires:
  - HepMC
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
  make ${JOBS:+-j $JOBS} -f Makefile CRMCROOT=$INSTALLROOT HEP_ROOT=${HepMC_ROOT}
  make -f Makefile install CRMCROOT=$INSTALLROOT HEP_ROOT=${HepMC_ROOT}
}
