package: thepeg
description: ThePEG Toolkit for High Energy Physics Event Generation
version: "2.2.1"
tag: "2.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/ThePEG-2.2.1.tar.bz2
requires:
  - GSL
  - lhapdf
build_requires:
  - bits-recipe-tools
license: LGPL-2.1-only
patches:
  - thepeg-2.2.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  autoreconf --install --force
  ./configure --prefix=$INSTALLROOT
}
