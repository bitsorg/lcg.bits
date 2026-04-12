package: feynhiggs
description: FeynHiggs Higgs boson mass and mixing calculations in MSSM
version: "2.10.2"
tag: "2.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/FeynHiggs-2.10.2.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - feynhiggs-2.10.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT FFLAGS=-fPIC CFLAGS=-fPIC
}
