package: photos
description: PHOTOS Monte Carlo for radiative corrections in decays
version: "215.4"
tag: "215.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/photos-215.4-src.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-PHOTOS
patches:
  - %(name)s-%(version)s.patch
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
  # Patch configure before running it so the generated Makeshared.subdir
  # already references gfortran rather than the hardcoded g77.
  grep -rl "g77" . | grep -Ev '\.(f|F|f90|F90|for|FOR)$' | \
    xargs --no-run-if-empty sed -i "s/\bg77\b/${F77}/g"
  ./configure --lcgplatform=${BITS_PLATFORM:-linux} --userfflags=-fno-automatic --enable-shared
}

function Make() {
  # Belt-and-suspenders: replace any g77 remaining in generated build files.
  grep -rl "g77" . | grep -Ev '\.(f|F|f90|F90|for|FOR)$' | \
    xargs --no-run-if-empty sed -i "s/\bg77\b/${F77}/g"
  make ${JOBS:+-j $JOBS}
}
