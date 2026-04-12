package: umesimd
description: umesimd library/tool (from LCG software stack)
version: "0.8.1"
tag: "0.8.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/umesimd-0.8.1.tgz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--include"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS}
  cmake -E make_directory $INSTALLROOT/include COMMAND cmake -E make_directory $INSTALLROOT/include/umesimd COMMAND cmake -E copy_directory $SOURCEDIR $INSTALLROOT/include/umesimd/
}
