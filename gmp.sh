package: gmp
description: GNU Multiple Precision Arithmetic Library
version: "6.2.1"
tag: "6.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gmp-6.2.1.tar.gz
requires:
  - m4
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
  ./configure --prefix=$INSTALLROOT --enable-cxx
}
