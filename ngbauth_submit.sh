package: ngbauth_submit
description: ngbauth-submit CERN DIRAC job submission auth utility
version: "0.29-1"
tag: "0.29-1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/NextGenBatchAuth-0.29-1.tar.gz
requires:
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS}
}
