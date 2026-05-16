package: SFGen
description: SFGen exclusive B-meson decay Monte Carlo generator
version: "1.03.atlas2"
tag: "1.03.atlas2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/SFGen1.03.atlas2.tar.gz
requires:
  - lhapdf
build_requires:
  - bits-recipe-tools
license: LicenseRef-SFGen
patches:
  - SFGen-1.03.atlas2.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS} FC=$FC
  cmake -E copy_directory $SOURCEDIR/lib $INSTALLROOT/lib \
  && cmake -E copy_directory $SOURCEDIR/bin $INSTALLROOT/bin \
  && cmake -E copy_directory $SOURCEDIR/doc $INSTALLROOT/doc \
  && cmake -E copy_directory $SOURCEDIR/src $INSTALLROOT/src \
  && chmod -R go+r $INSTALLROOT/src \
  && chmod -R go+r $INSTALLROOT/bin/input.DAT
}
