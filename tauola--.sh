package: tauola++
description: tauola++ Monte Carlo event generator
version: "1.1.6"
tag: "1.1.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/TAUOLA.1.1.6-LHC.tar.gz
requires:
  - lhapdf
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
  ./configure --prefix=$INSTALLROOT --with-pic --with-tau-spinner --with-lhapdf=${lhapdf_ROOT}
}
