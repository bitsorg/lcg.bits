package: sherpa-mpich2
description: Sherpa Monte Carlo event generator built with MPICH2
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/SHERPA-MC-unknown.tar.gz
requires:
  - lhapdf
  - HepMC
  - sqlite
  - mpich2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --enable-shared --enable-static --enable-binreloc --enable-analysis --enable-pythia --enable-hepevtsize=${sherpa_hepevt} --enable-lhapdf=${lhapdf_ROOT} --enable-hepmc2=${HepMC_ROOT} --enable-openloops=. --enable-lhole --enable-mpi --with-sqlite3=${sqlite_ROOT}
}
