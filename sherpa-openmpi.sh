package: sherpa-openmpi
description: sherpa-openmpi Monte Carlo event generator
version: "2.2.11p2.openmpi3"
tag: "2.2.11p2.openmpi3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/SHERPA-MC-2.2.11p2.openmpi3.tar.gz
requires:
  - lhapdf
  - openmpi
  - fastjet
  - openloops
  - #
  - blackhat
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
  make ${JOBS:+-j $JOBS} "LDFLAGS=-L${openmpi_ROOT}/lib -lmpi -lmpi_cxx" PATH=${openmpi_ROOT}/bin:$PATH LIBRARY_PATH=${lhapdf_ROOT}/lib ${library_path}=${openmpi_ROOT}/lib:${openmpi_ROOT}/lib/openmpi:${blackhat_ROOT}/lib:$ENV{${library_path}}
}