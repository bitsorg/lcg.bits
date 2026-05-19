package: libaio
description: Linux asynchronous I/O interface library
version: "0.3.110-1"
tag: "0.3.110-1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libaio-0.3.110-1.tar.gz
requires:
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS}
  make ${JOBS:+-j $JOBS} prefix=$INSTALLROOT install
}
function MakeInstall() { true; }
