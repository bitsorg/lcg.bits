package: gmp
description: GNU Multiple Precision arithmetic library
version: "6.2.1"
tag: "6.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gmp-6.2.1.tar.gz
requires:
  - m4
build_requires:
  - bits-recipe-tools
license: GPL-2.0-or-later OR LGPL-3.0-or-later
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
