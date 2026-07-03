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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT \
    "F77=${FC:-gfortran}" \
    "FC=${FC:-gfortran}" \
    "FFLAGS=-std=legacy -fallow-argument-mismatch" \
    "FCFLAGS=-std=legacy -fallow-argument-mismatch"
  # ninja-1.2.0/Makefile lists .mod files as all-am prerequisites, but automake
  # --tag=FC emits rules only for .lo objects (.mod files are silent FC side
  # effects). Add no-op rules so make can resolve them.
  {
    printf '\nninjago_module.mod: ninjago.lo\n\t@:\n'
    printf '\nquadninjago_module.mod: quadsources/ninjago.lo\n\t@:\n'
    printf '\nninjavholo.mod: ninjavholo.lo\n\t@:\n'
    printf '\nmninja.mod: mninja.lo\n\t@:\n'
  } >> ninja-1.2.0/Makefile
}

function Make() {
  # macOS: golem95's dylibs (libgolem, ...) leave libgfortran runtime symbols
  # undefined; the bundled libtool left allow_undefined_flag="" so the link
  # dropped -undefined dynamic_lookup. Patch generated libtool to match Linux.
  bits_patch_libtool_undefined
  make ${JOBS:+-j $JOBS}
}
