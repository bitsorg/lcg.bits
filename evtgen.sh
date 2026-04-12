package: evtgen
description: Monte Carlo event generator for B-meson and other particle decays
version: "1.7.0"
tag: "1.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/evtgen-<evtgen_1.7.0_tag>.tar.gz
requires:
  - pythia8
  - photos++
  - tauola++
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - evtgen-1.7.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DEVTGEN_PHOTOS=ON \
    -DPHOTOSPP_ROOT_DIR=${photos++_home} \
    -DEVTGEN_PYTHIA=ON \
    -DPYTHIA8_ROOT_DIR=${pythia8_ROOT} \
    -DEVTGEN_TAUOLA=ON \
    -DTAUOLAPP_ROOT_DIR=${tauola++_home}
}
function Make() {
  make ${JOBS:+-j $JOBS} -j1 FLIBS=${FORTRAN_LIBRARY}
}
