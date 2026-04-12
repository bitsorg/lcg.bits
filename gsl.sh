package: GSL
description: GNU Scientific Library for numerical computations
version: "2.8"
tag: "2.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gsl-2.8.tar.gz
build_requires:
  - bits-recipe-tools
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  $SOURCEDIR/configure --prefix $INSTALLROOT ${GSL_config_options} CC=$CC CFLAGS=-O2
}
