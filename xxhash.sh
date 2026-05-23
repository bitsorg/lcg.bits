package: xxHash
description: xxHash extremely fast non-cryptographic hash algorithm
version: "0.8.2"
tag: "0.8.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS}
  make ${JOBS:+-j $JOBS} install PREFIX=$INSTALLROOT CC=$CC
}
function MakeInstall() { true; }
