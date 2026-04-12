package: babayaga
description: babayaga Monte Carlo event generator
version: "fcc1.0.0"
tag: "fcc1.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/babayaga-fcc1.0.0).tar.bz2
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
  cmake -E make_directory $INSTALLROOT/bin COMMAND chmod +x $SOURCEDIR/babayaga-fcc COMMAND cmake
}
