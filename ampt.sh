package: ampt
description: AMPT (A Multi-Phase Transport) heavy-ion event generator
version: "2.26t9b_atlas"
tag: "2.26t9b_atlas"
sources:
  # Upstream tarball is named without the _atlas suffix; _atlas denotes the
  # ATLAS-specific patch set applied on top of the vanilla 2.26t9b release.
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/ampt-2.26t9b.zip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-Ampt
patches:
  - ampt-2.26t9b_atlas.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Make() {
  # Old Fortran-77 code; -std=legacy silences GCC 10+ dialect errors
  make ${JOBS:+-j $JOBS} \
    FC="${FC:-gfortran}" \
    FFLAGS="-std=legacy -fallow-argument-mismatch -O2 -fPIC"
}

function MakeInstall() {
  install -dm755 "$INSTALLROOT/bin"
  install -m755 ampt "$INSTALLROOT/bin/ampt"
  # Ship the default input card so users have a starting point
  install -m644 input.ampt "$INSTALLROOT/bin/input.ampt"
}
