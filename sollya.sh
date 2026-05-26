package: sollya
description: Sollya environment for safe floating-point code development
version: "8.0"
tag: "8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.bz2
requires:
  - gmp
  - mpfr
  - mpfi
  - libxml2
  - fplll
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
patches:
  - sollya-8.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix="${INSTALLROOT}" \
    ${GMP_ROOT:+--with-gmp="${GMP_ROOT}"} \
    ${MPFR_ROOT:+--with-mpfr="${MPFR_ROOT}"} \
    ${MPFI_ROOT:+--with-mpfi="${MPFI_ROOT}"} \
    ${FPLLL_ROOT:+--with-fplll="${FPLLL_ROOT}"}
}
