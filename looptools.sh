package: looptools
description: LoopTools library for Passarino-Veltman one-loop integrals
version: "2.15"
tag: "2.15"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/LoopTools-2.15.tar.gz
build_requires:
  - bits-recipe-tools
license: LGPL-3.0-or-later
patches:
  - looptools-2.15.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT "FFLAGS=-fPIC -std=legacy" CFLAGS=-fPIC
}
