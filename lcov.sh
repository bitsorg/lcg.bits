package: lcov
description: lcov library/tool (from LCG software stack)
version: "1.14"
tag: "1.14"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lcov-1.14.tar.gz
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
  make ${JOBS:+-j $JOBS} install PREFIX=$INSTALLROOT
}
