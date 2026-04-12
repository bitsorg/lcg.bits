package: p7zip
description: p7zip library/tool (from LCG software stack)
version: "16.02"
tag: "16.02"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/p7zip_16.02_src_all.tar.bz2
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - p7zip-16.02.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS} all2
  cmake -E copy_directory $SOURCEDIR/bin $INSTALLROOT/bin
}
