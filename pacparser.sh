package: pacparser
description: pacparser library to parse proxy auto-config (PAC) files
version: "1.4.3"
tag: "1.4.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pacparser-1.4.3.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
patches:
  - pacparser-1.4.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS} -j1 -C src
  make ${JOBS:+-j $JOBS} -j1 PREFIX=$INSTALLROOT -C src install
}
function MakeInstall() { true; }
