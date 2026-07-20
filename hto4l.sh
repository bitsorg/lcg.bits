package: hto4l
description: HTo4l NLO generator for H→4 leptons via gg fusion
version: "2.02"
tag: "2.02"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/Hto4l-v2.02.tar.bz2
requires:
  - GSL
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-HTo4l
# academic-use licence with no redistribution grant (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: none
patches:
  - hto4l-2.02.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS} GSL_HOME="${GSL_ROOT}"
}

function MakeInstall() {
  install -dm755 "$INSTALLROOT/bin" "$INSTALLROOT/lib"
  [ -f hto4l ] && install -m755 hto4l "$INSTALLROOT/bin/"
  [ -f libHto4l.a ] && install -m644 libHto4l.a "$INSTALLROOT/lib/"
}
