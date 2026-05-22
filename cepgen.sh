package: cepgen
description: CepGen central exclusive production event generator
version: "1.2.5patch2"
tag: "1.2.5patch2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/cepgen-1.2.5patch2.tar.gz
requires:
  - CMake
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
  - photoscpp
  - tauolacpp
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
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_VERBOSE_MAKEFILE=ON
}
