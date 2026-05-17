package: gosam_contrib
description: GoSam contrib package for automated one-loop calculations
version: "2.0-20200904"
tag: "2.0-20200904"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/gosam-contrib-2.0-20200904.tar.gz
requires:
  - looptools
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
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
  ./configure --prefix=$INSTALLROOT "FFLAGS=-std=legacy" #                    --with-looptools=${looptools_ROOT}
}
