package: tauola
description: TAUOLA Monte Carlo generator for tau lepton decays
version: "28.121.2"
tag: "28.121.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/tauola-28.121.2-src.tgz
requires:
  - photos
  - pythia6
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-TAUOLA
patches:
  - tauola-28.121.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Force the Linux-gcc4 branch in the configure script so it sets FC=gfortran
  # instead of the default FC=g77 (GCC 3.x era, no longer available).
  export ARCH=Linux-gcc4
  export COMPMODE=OPT
  ./configure --prefix="$INSTALLROOT" --datadir="$INSTALLROOT/data"
}
