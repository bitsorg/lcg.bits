package: gosam_contrib
description: GoSam contrib package for automated one-loop calculations
version: "2.0-20200904"
tag: "2.0-20200904"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/gosam-contrib-2.0-20200904.tar.gz
requires:
  - looptools
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT \
    "F77=${FC:-gfortran}" \
    "FC=${FC:-gfortran}" \
    "FFLAGS=-std=legacy -fallow-argument-mismatch" \
    "FCFLAGS=-std=legacy -fallow-argument-mismatch"
    # --with-looptools=${LOOPTOOLS_ROOT}
}

function Make() {
  # V=1 disables libtool's >/dev/null 2>&1 redirect so compiler errors
  # are visible in the build log.  Remove V=1 once the build is stable.
  make V=1 ${JOBS:+-j $JOBS}
}
