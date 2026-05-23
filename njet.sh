package: njet
description: NJet multi-parton one-loop matrix element library
version: "2.1.1"
tag: "2.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - qd
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix="$INSTALLROOT" \
    --disable-autoflags \
    ${QD_ROOT:+--with-qd="$QD_ROOT"} \
    "FFLAGS=-ffixed-line-length-none -std=legacy" \
    FC=${FC:-gfortran} CC=$CC F77=${FC:-gfortran}
}
