package: bhlumi
description: bhlumi Monte Carlo event generator
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/bhlumi-unknown.tar.gz
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
  $SHELL -c "cd ./4.x-cpc && make -f makefile lhemain"
  cmake -E make_directory $INSTALLROOT/bin COMMAND chmod +x $SOURCEDIR/4.x-cpc/demo2.exe COMMAND cmake
}