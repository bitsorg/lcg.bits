package: cepgen
description: CepGen central exclusive production event generator
version: "1.2.5patch2"
tag: "1.2.5patch2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/cepgen-1.2.5patch2.tar.gz
requires:
  - apfel
  - Boost
  - lhapdf
  - pythia6
  - delphes
  - pythia8
  - GSL
  - HepMC
  - hepmc3
  - tbb
  - vdt
  - photos++
  - tauola++
  - Python
  - jsonmcpp
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake \
    -DCMAKE_VERBOSE_MAKEFILE=ON
}
