package: hepmcanalysis
description: HepMCAnalysis generator-level analysis tools using HepMC
version: "3.4.14"
tag: "3.4.14"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/HepMCAnalysis-3.4.14.tgz
requires:
  - HepMC
  - fastjet
  - ROOT
  - clhep
build_requires:
  - bits-recipe-tools
license: GPL-3.0-or-later
patches:
  - hepmcanalysis-3.4.14.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS} HepMCdir=${HepMC_ROOT} FastJetdir=${fastjet_ROOT} ROOTSYS=${ROOT_ROOT} CLHEPdir=${clhep_ROOT} ${library_path}=${clhep_ROOT}/lib:$ENV{${library_path}} LIBRARY_PATH=${fastjet_ROOT}/lib:$LIBRARY_PATH
  cmake -E copy_directory $SOURCEDIR/lib $INSTALLROOT/lib \
  && cmake -E copy_directory $SOURCEDIR/include $INSTALLROOT/include
}