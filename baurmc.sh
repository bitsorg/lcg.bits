package: baurmc
description: baurmc BAUR Monte Carlo interface utility
version: "1.0"
tag: "1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/baurmc-1.0-src.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # g77 (GNU Fortran 77) was retired; modern GCC provides gfortran instead.
  # Export F77 so both configure and the subsequent make pick it up.
  export F77=${FC:-gfortran}
  ./configure --lcgplatform=${BITS_PLATFORM:-linux} --userfflags=-fno-automatic ${baurmc_fflag} --enable-shared
}

function Make() {
  make ${JOBS:+-j $JOBS} F77=${FC:-gfortran}
}