package: jhu
description: jhu Monte Carlo event generator
version: "5.6.3"
tag: "5.6.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/JHUGenerator.v5.6.3.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - jhu-5.6.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS} -j1 -C JHUGenerator Comp=gfortran
  cmake -E make_directory $INSTALLROOT/bin COMMAND cmake
}
