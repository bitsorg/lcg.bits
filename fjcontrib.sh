package: fjcontrib
description: FastJet contrib package collection of add-on jet tools
version: "1.102"
tag: "1.102"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fjcontrib-1.102.tar.gz
requires:
  - fastjet
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  $SOURCEDIR/configure --prefix=$INSTALLROOT --fastjet-config=${fastjet_ROOT}/bin/fastjet-config
}
