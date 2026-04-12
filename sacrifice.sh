package: sacrifice
description: sacrifice Monte Carlo event generator
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/Sacrifice-unknown.tar.gz
requires:
  - pythia8
  - Boost
  - HepMC
  - lhapdf
  - photos++
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
  ./configure --prefix=$INSTALLROOT --with-HepMC=${HepMC_ROOT} --with-pythia=${pythia8_ROOT} --with-LHAPDF=${lhapdf_ROOT} --with-photos=${photos++_home} --with-boost=${Boost_ROOT} --with-MCUtils "CFLAGS=${C_FLAGS}" "CXXFLAGS=${CXX_FLAGS}"
}
