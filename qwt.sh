package: qwt
description: Qt Widgets for Technical Applications (Qwt)
version: "6.0.1"
tag: "6.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/qwt-6.0.1.tar.bz2
requires:
  - Qt
build_requires:
  - bits-recipe-tools
license: LGPL-2.1-or-later
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
