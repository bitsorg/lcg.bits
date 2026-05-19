package: herwig++
description: Herwig++ Monte Carlo event generator (legacy C++ version)
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/Herwig++-unknown.tar.bz2
requires:
  - GSL
  - Boost
  - thepeg
  - fastjet
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --with-gsl=${GSL_ROOT} --with-thepeg=${thepeg_ROOT} --with-fastjet=${fastjet_ROOT} --with-boost=${Boost_ROOT} ${library_path}=${thepeg_ROOT}/lib/ThePEG:${GSL_ROOT}/lib:${Boost_ROOT}/lib:$ENV{${library_path}}
}