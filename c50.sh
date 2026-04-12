package: C50
description: C50 library/tool (from LCG software stack)
version: "2.07"
tag: "2.07"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/C50-2.07.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - C50-2.07.patch
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
  make ${JOBS:+-j $JOBS} COMMAND cmake
}
