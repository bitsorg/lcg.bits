package: dire4pythia8
description: dire4pythia8 Monte Carlo event generator
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/DIRE-unknown.tar.gz
requires:
  - pythia8
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
  ./configure --enable-shared --prefix=$INSTALLROOT --with-pythia8=${pythia8_ROOT}
}
