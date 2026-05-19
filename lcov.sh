package: lcov
description: LCOV graphical front-end for GCC code coverage (HTML reports)
version: "1.14"
tag: "1.14"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lcov-1.14.tar.gz
requires:
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS}
  make ${JOBS:+-j $JOBS} install PREFIX=$INSTALLROOT
}
function MakeInstall() { true; }
