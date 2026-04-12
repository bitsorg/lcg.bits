package: compilebox
description: compilebox Monte Carlo event generator
version: "08.11"
tag: "08.11"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/compilebox-08.11.tar.gz
requires:
  - GSL
  - looptools
  - chaplin
  - cln
  - fastjet
  - ggvvamp
  - lhapdf
  - nlox
  - openloops
  - photos++
  - pythia8
  - qqvvamp
  - recola
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
  wget ${gen_url}/compilebox-processes-<compilebox_08.11_author>.tar.gz COMMAND tar xvf compilebox-processes-<compilebox_08.11_author>.tar.gz -C $SOURCEDIR/COMPILEBOX/ COMMAND cmake -DCMAKE_BUILD_TYPE=Release -DLOCAL_SOURCE=$SOURCEDIR/COMPILEBOX/compilebox-processes-<compilebox_08.11_author> -DCMAKE_INSTALL_PREFIX=$INSTALLROOT -DDESTINATION=$SOURCEDIR/COMPILEBOX_PROCESSES/ -DCMAKE_CXX_STANDARD=17 $SOURCEDIR/COMPILEBOX COMMAND cp $SOURCEDIR/COMPILEBOX_PROCESSES/POWHEG-BOX-V2/zlibdummy.c $SOURCEDIR/COMPILEBOX_PROCESSES/POWHEG-BOX-RES/zlibdummy.c
  make ${JOBS:+-j $JOBS}
  make install
}
