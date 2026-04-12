package: tauola
description: tauola Monte Carlo event generator
version: "28.121.2"
tag: "28.121.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/tauola-28.121.2-src.tgz
requires:
  - photos
  - pythia6
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - tauola-28.121.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT --datadir=$INSTALLROOT/data --with-pythia6=${pythia6_ROOT} --with-photos=${photos_ROOT} --with-hepevt=4000
}
