package: fjcontrib
description: FastJet Contrib package of jet substructure tools and plugins
version: "1.102"
tag: "1.102"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fjcontrib-1.102.tar.gz
requires:
  - fastjet
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
  $SOURCEDIR/configure --prefix=$INSTALLROOT --fastjet-config=${fastjet_ROOT}/bin/fastjet-config
}
