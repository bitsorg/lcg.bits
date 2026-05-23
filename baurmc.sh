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
  export F77=${FC:-gfortran}
  # Replace hardcoded g77 in configure and generated build files before
  # running configure so Makeshared.subdir / Makearchive.subdir are correct.
  grep -rl "g77" . | grep -Ev '\.(f|F|f90|F90|for|FOR)$' | \
    xargs --no-run-if-empty sed -i "s/\bg77\b/${F77}/g"
  ./configure --lcgplatform=${BITS_PLATFORM:-linux} --userfflags=-fno-automatic ${baurmc_fflag} --enable-shared
}

function Make() {
  # Belt-and-suspenders: replace any g77 still present in generated files.
  grep -rl "g77" . | grep -Ev '\.(f|F|f90|F90|for|FOR)$' | \
    xargs --no-run-if-empty sed -i "s/\bg77\b/${F77}/g"
  make ${JOBS:+-j $JOBS}
}