package: bhlumi
description: BHLUMI Monte Carlo generator for Bhabha scattering
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/bhlumi-unknown.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-BHLUMI
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() { true; }
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  $SHELL -c "cd ./4.x-cpc && make -f makefile lhemain"
}
function MakeInstall() {
  cmake -E make_directory $INSTALLROOT/bin
  chmod +x $SOURCEDIR/4.x-cpc/demo2.exe
  cmake -E copy $SOURCEDIR/4.x-cpc/demo2.exe $INSTALLROOT/bin/BHLUMI.exe
  cmake -E copy ${SOURCEDIR}/../bhlumi/BHLUMI $INSTALLROOT/bin
}