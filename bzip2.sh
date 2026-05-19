package: bzip2
description: bzip2 high-quality block-sorting data compression library
version: "1.0.6"
tag: "1.0.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/bzip2-1.0.6.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-bzip2
patches:
  - bzip2-1.0.6.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() { true; }
function Make() {
  make ${JOBS:+-j $JOBS}
}
function MakeInstall() {
  make install PREFIX=$INSTALLROOT
}
