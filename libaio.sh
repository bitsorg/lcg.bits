package: libaio
description: libaio library/tool (from LCG software stack)
version: "0.3.110-1"
tag: "0.3.110-1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libaio-0.3.110-1.tar.gz
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
  make ${JOBS:+-j $JOBS} prefix=$INSTALLROOT install
}
