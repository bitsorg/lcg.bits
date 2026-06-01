package: photoscpp
description: PHOTOS++ C++ version of PHOTOS radiative corrections
version: "3.61"
tag: "3.61"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/PHOTOS.3.61-LHC.tar.gz
requires:
  - HepMC
  - hepmc3
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
  # Build BOTH the HepMC2 and HepMC3 interface libraries. The HepMC3 variant
  # (libPhotosppHepMC3) is required by kkmcee and cepgen; with only --with-hepmc
  # it was never built, so those packages could not find it.
  ./configure --prefix="${INSTALLROOT}" \
    --with-hepmc="${HEPMC_ROOT}" \
    ${HEPMC3_ROOT:+--with-hepmc3="${HEPMC3_ROOT}"} \
    CFLAGS=-O2 FFLAGS=-O2 F77="${FC:-gfortran}" CXXFLAGS="-O2"
}
