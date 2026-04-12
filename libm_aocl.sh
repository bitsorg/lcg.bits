package: libm_aocl
description: libm_aocl library/tool (from LCG software stack)
version: "3.1.0"
tag: "3.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/aocl-libm-linux-gcc-3.1.0.tar.gz
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
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT
}
