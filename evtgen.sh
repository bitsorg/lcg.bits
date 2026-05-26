package: evtgen
description: EvtGen Monte Carlo generator for B/D meson decays
version: "1.7.0"
tag: "1.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/evtgen-R01-07-00.tar.gz
requires:
  - HepMC
  - pythia8
  - photoscpp
  - tauolacpp
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
patches:
  - evtgen-1.7.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure \
    --prefix="${INSTALLROOT}" \
    ${HEPMC_ROOT:+--hepmcdir="${HEPMC_ROOT}"} \
    ${PYTHIA8_ROOT:+--pythiadir="${PYTHIA8_ROOT}"} \
    ${PHOTOSCPP_ROOT:+--photosdir="${PHOTOSCPP_ROOT}"} \
    ${TAUOLACPP_ROOT:+--tauoladir="${TAUOLACPP_ROOT}"}
}
