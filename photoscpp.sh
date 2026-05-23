package: photoscpp
description: PHOTOS++ C++ version of PHOTOS radiative corrections
version: "3.61"
tag: "3.61"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/PHOTOS.3.61-LHC.tar.gz
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
  # Build without HepMC event-record support; HepMC is not a declared dependency.
  # Pass --without-hepmc explicitly because the configure script requires one of
  # --with-hepmc=<path> or --without-hepmc and aborts if neither is given.
  ./configure --prefix=$INSTALLROOT --without-hepmc \
    CFLAGS=-O2 FFLAGS=-O2 F77=${FC:-gfortran} "CXXFLAGS=${PHOTOS_CXX_FLAGS} -O2"
}
