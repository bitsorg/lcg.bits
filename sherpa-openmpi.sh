package: sherpa-openmpi
description: Sherpa Monte Carlo event generator built with OpenMPI
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
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS} "LDFLAGS=-L${OPENMPI_ROOT}/lib -lmpi -lmpi_cxx" PATH=${OPENMPI_ROOT}/bin:$PATH LIBRARY_PATH=${LHAPDF_ROOT}/lib ${library_path}=${OPENMPI_ROOT}/lib:${OPENMPI_ROOT}/lib/openmpi:${BLACKHAT_ROOT}/lib:$ENV{${library_path}}
}