package: photoscpp
description: PHOTOS++ C++ version of PHOTOS radiative corrections
version: "3.61"
tag: "3.61"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/PHOTOS.3.61-LHC.tar.gz
requires:
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
  # Build against HepMC3 only (libPhotosppHepMC3), required by kkmcee, cepgen and
  # EvtGen 2.x. lcgcmake builds photos++ with exactly one HepMC flavour: passing
  # both --with-hepmc (HepMC2) and --with-hepmc3 did not produce the HepMC3
  # interface library, so consumers could not find libPhotosppHepMC3. Mirror
  # lcgcmake's modern config: --with-hepmc3 + --without-hepmc.
  ./configure --prefix="${INSTALLROOT}" \
    --with-hepmc3="${HEPMC3_ROOT}" \
    --without-hepmc \
    CFLAGS=-O2 FFLAGS=-O2 F77="${FC:-gfortran}" CXXFLAGS="-O2"
}
