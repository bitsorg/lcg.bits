package: ampt
description: AMPT (A Multi-Phase Transport) heavy-ion event generator
version: "2.26t9b_atlas"
tag: "2.26t9b_atlas"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/ampt-2.26t9b_atlas.zip
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-Ampt
patches:
  - ampt-2.26t9b_atlas.patch
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
  cmake -DSRC=$SOURCEDIR -DDST=$INSTALLROOT -P # (lcgcmake-internal script removed)
}