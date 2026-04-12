package: kkmcee
description: kkmcee Monte Carlo event generator
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/kkmcee-unknown.tar.gz
requires:
  - ROOT
  - photos++
  - hepmc3
  - autoconf
  - automake
  - libtool
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
  cmake -E create_symlink dizet-6.45 dizet COMMAND autoreconf --force --install COMMAND ./configure --with-photos=${photos++_home} --prefix=$INSTALLROOT
}
