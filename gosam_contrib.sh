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
  # ninja-1.2.0/Makefile lists Fortran .mod files as prerequisites of all-am
  # for installation, but automake --tag=FC only emits rules for .lo object
  # files — .mod files are produced as silent side effects of FC compilation
  # and have no explicit make rule.  Add no-op rules so make can resolve them.
  {
    printf '\nninjago_module.mod: ninjago.lo\n\t@:\n'
    printf '\nquadninjago_module.mod: quadsources/ninjago.lo\n\t@:\n'
    printf '\nninjavholo.mod: ninjavholo.lo\n\t@:\n'
    printf '\nmninja.mod: mninja.lo\n\t@:\n'
  } >> ninja-1.2.0/Makefile
}

function Make() {
  make ${JOBS:+-j $JOBS}
}
