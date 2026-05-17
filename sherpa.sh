package: sherpa
description: Sherpa multi-purpose Monte Carlo event generator
version: "2.2.11p2"
tag: "2.2.11p2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/SHERPA-MC-2.2.11p2.tar.gz
requires:
  - lhapdf
  - fastjet
  - openloops
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
patches:
  - sherpa-2.2.11p2.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS} LIBRARY_PATH=${lhapdf_ROOT}/lib CPPFLAGS=-I${Boost_home_include} CPATH=${Boost_home_include}
}
