package: gosam_contrib
description: gosam_contrib Monte Carlo event generator
version: "2.0-20200904"
tag: "2.0-20200904"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/gosam-contrib-2.0-20200904.tar.gz
requires:
  - looptools
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
  ./configure --prefix=$INSTALLROOT "FFLAGS=-std=legacy" #                    --with-looptools=${looptools_ROOT}
}
