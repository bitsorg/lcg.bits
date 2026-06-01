package: tauolacpp
description: TAUOLA++ C++ version of TAUOLA tau decay generator
version: "1.1.6"
tag: "1.1.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/TAUOLA.1.1.6-LHC.tar.gz
requires:
  - HepMC
  - hepmc3
  - lhapdf
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-TAUOLA++
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Build the HepMC3 interface library too (libTauolaCppHepMC3 / TAUOLAPP_HEPMC3)
  # -- cepgen's PhotosTauola wrapper requires it; with only --with-hepmc it was
  # never built.
  ./configure --prefix=$INSTALLROOT \
    --with-pic \
    --with-tau-spinner \
    ${HEPMC_ROOT:+--with-hepmc="${HEPMC_ROOT}"} \
    ${HEPMC3_ROOT:+--with-hepmc3="${HEPMC3_ROOT}"} \
    ${LHAPDF_ROOT:+--with-lhapdf="${LHAPDF_ROOT}"}
}
