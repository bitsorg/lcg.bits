package: mcutils
description: MCUtils Monte Carlo utility functions for HEP analyses
version: "1.4.0"
tag: "1.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/mcutils-1.4.0.tar.gz
requires:
  - heputils
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS}
  make install PREFIX=$INSTALLROOT
}
function MakeInstall() { true; }
