package: mcutils
description: MCUtils Monte Carlo utility functions for HEP analyses
version: "1.4.0"
source: https://gitlab.com/hepcedar/mcutils
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - heputils
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS}
  make install PREFIX=$INSTALLROOT
}
function MakeInstall() { true; }
