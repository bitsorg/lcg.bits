package: compilebox
description: Compilebox online compiler sandbox service
version: "08.11"
tag: "08.11"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - GSL
  - looptools
  - chaplin
  - cln
  - fastjet
  - ggvvamp
  - lhapdf
  - nlox
  - openloops
  - photoscpp
  - pythia8
  - qqvvamp
  - recola
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  wget ${gen_url}/compilebox-processes-<compilebox_08.11_author>.tar.gz \
  && tar xvf compilebox-processes-<compilebox_08.11_author>.tar.gz -C $SOURCEDIR/COMPILEBOX/ \
  && cmake -DCMAKE_BUILD_TYPE=Release -DLOCAL_SOURCE="$SOURCEDIR/COMPILEBOX/compilebox-processes-<compilebox_08.11_author>" -DCMAKE_INSTALL_PREFIX="$INSTALLROOT" -DDESTINATION="$SOURCEDIR/COMPILEBOX_PROCESSES/" -DCMAKE_CXX_STANDARD=17 $SOURCEDIR/COMPILEBOX \
  && cp $SOURCEDIR/COMPILEBOX_PROCESSES/POWHEG-BOX-V2/zlibdummy.c $SOURCEDIR/COMPILEBOX_PROCESSES/POWHEG-BOX-RES/zlibdummy.c
  make ${JOBS:+-j $JOBS}
  make install
}
function MakeInstall() { true; }  # install folded into Make()
