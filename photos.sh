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
  ./configure --lcgplatform=${BITS_PLATFORM:-linux} --userfflags=-fno-automatic --enable-shared
}
