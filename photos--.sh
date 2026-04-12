package: photos++
description: photos++ Monte Carlo event generator
version: "3.61"
tag: "3.61"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/PHOTOS.3.61-LHC.tar.gz
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
  ./configure --prefix=$INSTALLROOT  CFLAGS=-O2 FFLAGS=-O2 F77=$FC "CXXFLAGS=${PHOTOS_CXX_FLAGS} -O2"
}
