package: qwt
description: qwt library/tool (from LCG software stack)
version: "6.0.1"
tag: "6.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/qwt-6.0.1.tar.bz2
requires:
  - Qt
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - qwt-6.0.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ${Qt_ROOT}/bin/qmake QWT_INSTALL_PREFIX=$INSTALLROOT
  make ${JOBS:+-j $JOBS}
  make install
}
