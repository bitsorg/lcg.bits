package: ngbauth_submit
description: ngbauth_submit library/tool (from LCG software stack)
version: "0.29-1"
tag: "0.29-1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/NextGenBatchAuth-0.29-1.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
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
  cmake
}
