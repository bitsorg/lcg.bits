package: lcov
description: LCOV graphical front-end for GCC code coverage (HTML reports)
version: "1.14"
source: https://github.com/linux-test-project/lcov
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
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
