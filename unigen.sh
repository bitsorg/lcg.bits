package: unigen
description: UniGen universal Monte Carlo event format and library
version: "2.2"
tag: "2.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/unigen-2.2.tar.gz
requires:
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
patches:
  - unigen-2.2.patch
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
  make ${JOBS:+-j $JOBS} DESTDIR=$INSTALLROOT install
}
function MakeInstall() { true; }
