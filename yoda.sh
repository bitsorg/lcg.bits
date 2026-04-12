package: yoda
description: YODA Yet more Objects for Data Analysis (HEP histogramming)
version: "1.9.0"
tag: "1.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/YODA-1.9.0.tar.gz
requires:
  - Python
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
  $SOURCEDIR/configure --prefix=$INSTALLROOT CXXFLAGS=-Wno-register --with-boost=${Boost_ROOT}
}
