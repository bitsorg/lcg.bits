package: bzip2
description: bzip2 high-quality block-sorting data compression library
version: "1.0.6"
source: https://sourceware.org/git/bzip2.git
tag: "bzip2-%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: bzip2-1.0.6
acknowledgment: "bzip2 — Copyright (C) 1996-2010 Julian R Seward."
patches:
  - bzip2-1.0.6.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() { true; }
function Make() {
  make ${JOBS:+-j $JOBS}
}
function MakeInstall() {
  make install PREFIX=$INSTALLROOT
}
