package: herwig
description: Herwig Monte Carlo event generator for high-energy collisions
version: "6.521.2"
tag: "6.521.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/herwig-6.521.2-src.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
patches:
  - herwig-6.521.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT "FFLAGS=-O2 -fPIC -Wuninitialized -fno-automatic" F77=$FC CC=$CC
}
