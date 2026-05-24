package: photoscpp
description: PHOTOS++ C++ version of PHOTOS radiative corrections
version: "3.61"
tag: "3.61"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/PHOTOS.3.61-LHC.tar.gz
requires:
  - HepMC  
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-PHOTOS++
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix="${INSTALLROOT}" \
    --with-hepmc="${HEPMC_ROOT}" \
    CFLAGS=-O2 FFLAGS=-O2 F77="${FC:-gfortran}" CXXFLAGS="-O2"
}
