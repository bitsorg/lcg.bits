package: bzip2
description: bzip2 lossless data compression library
version: "1.0.6"
tag: "1.0.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/bzip2-1.0.6.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - bzip2-1.0.6.patch
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
  make ${JOBS:+-j $JOBS} install PREFIX=$INSTALLROOT PACKAGE_FINDER BZip2
}
