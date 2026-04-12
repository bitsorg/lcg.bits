package: baurmc
description: baurmc Monte Carlo event generator
version: "1.0"
tag: "1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/baurmc-1.0-src.tgz
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
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --lcgplatform=${BITS_PLATFORM:-linux}  --userfflags=-fno-automatic ${baurmc_fflag} --enable-shared
}