package: prophecy4f
description: prophecy4f Monte Carlo event generator
version: "3.0.2"
tag: "3.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/Prophecy4f-3.0.2.tar.gz
requires:
  - collier
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
  make ${JOBS:+-j $JOBS} COLLIERDIR=${collier_ROOT}/lib FC=gfortran INPUT=-I${collier_ROOT}/include/
  cmake -E make_directory $INSTALLROOT/bin COMMAND cmake
}
