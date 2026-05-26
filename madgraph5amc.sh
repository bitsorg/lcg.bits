package: madgraph5amc
description: MadGraph5_aMC@NLO automated leading and next-to-leading order generator
version: "3.3.1.atlas1"
tag: "3.3.1.atlas1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/MG5_aMC_v3.3.1.tar.gz
requires:
  - Python
  - syscalc
  - six
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
patches:
  - madgraph5amc-3.3.1.atlas1.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS} -j1 -C vendor/CutTools
  $SHELL -c "echo Installing madgraph 3.3.1.atlas1"
}