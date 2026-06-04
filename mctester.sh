package: mctester
description: MC-TESTER toolkit for comparisons of Monte Carlo generators
version: "1.25.1"
tag: "1.25.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/MC-TESTER-1.25.1.tar.gz
requires:
  - ROOT
  - HepMC
  - hepmc3
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-MCTester
patches:
  - mctester-1.25.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT \
    --with-root=${ROOT_ROOT}/bin \
    ${HEPMC_ROOT:+--with-HepMC=${HEPMC_ROOT}} \
    ${HEPMC3_ROOT:+--with-HepMC3=${HEPMC3_ROOT}} \
    "F77=${FC:-gfortran}" "CFLAGS=-O2 -g0" "CXXFLAGS=-O2 -g0" "FFLAGS=-O2 -g0"
}
