package: powheg-box-v2
description: POWHEG BOX v2 NLO event generator framework
version: "r3744.lhcb3.rdynamic"
tag: "r3744.lhcb3.rdynamic"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/powheg-box-v2-r3744.lhcb3.rdynamic.tar.gz
requires:
  - fastjet
  - lhapdf
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-POWHEG
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS} -f Makefile.lhcb FCOMP=$FC CCOMP=$CXX LHAPDF=${LHAPDF_ROOT} FASTJET=${FASTJET_ROOT}
  make ${JOBS:+-j $JOBS} -f Makefile.lhcb install PREFIX=$INSTALLROOT
}
function MakeInstall() { true; }
