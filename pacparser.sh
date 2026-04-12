package: pacparser
description: pacparser library/tool (from LCG software stack)
version: "1.4.3"
tag: "1.4.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pacparser-1.4.3.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - pacparser-1.4.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS} -j1 -C src
  make ${JOBS:+-j $JOBS} -j1 PREFIX=$INSTALLROOT -C src install
}
