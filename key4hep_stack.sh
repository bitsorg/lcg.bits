package: key4hep_stack
description: key4hep_stack Key4hep framework package
version: "0"
tag: "0"
requires:
  - podio
  - EDM4hep
  - DD4hep
  - Gaudi
  - k4fwcore
  - k4edm4hep2lcioconv
  - k4marlinwrapper
  - k4geo
  - k4simgeant4
  - k4reco
  - k4gen
  - k4reccalorimeter
  - k4gaudipandora
  - k4mljettagger
  - k4actstracking
  - LCIO
  - #
  - marlin
  - marlinutil
  - marlintrk
  - kaltest
  - ddkaltest
  - raida
  - GSL
  - aidatt
  - kkmcee
  - ipython
  - mold
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
  make ${JOBS:+-j $JOBS}
  make install
}
