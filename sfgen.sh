package: SFGen
description: SFGen Monte Carlo event generator
version: "1.03.atlas2"
tag: "1.03.atlas2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/SFGen1.03.atlas2.tar.gz
requires:
  - lhapdf
build_requires:
  - bits-recipe-tools
license: TODO
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
  cmake -E copy_directory $SOURCEDIR/lib $INSTALLROOT/lib COMMAND cmake -E copy_directory $SOURCEDIR/bin $INSTALLROOT/bin COMMAND cmake -E copy_directory $SOURCEDIR/doc $INSTALLROOT/doc COMMAND cmake -E copy_directory $SOURCEDIR/src $INSTALLROOT/src COMMAND chmod -R go+r $INSTALLROOT/src COMMAND chmod -R go+r $INSTALLROOT/bin/input.DAT
}
