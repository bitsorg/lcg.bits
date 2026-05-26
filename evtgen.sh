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
  # The evtgen-1.7.0.patch removes the CXX=g++ default so that the configure
  # script honours the caller's CXX.  Ensure it is set before we call it.
  export CXX="${CXX:-g++}"
  export FC="${FC:-gfortran}"
  ./configure \
    --prefix="${INSTALLROOT}" \
    ${HEPMC_ROOT:+--hepmcdir="${HEPMC_ROOT}"} \
    ${PYTHIA8_ROOT:+--pythiadir="${PYTHIA8_ROOT}"} \
    ${PHOTOSCPP_ROOT:+--photosdir="${PHOTOSCPP_ROOT}"} \
    ${TAUOLACPP_ROOT:+--tauoladir="${TAUOLACPP_ROOT}"}
}
function Make() {
  # Belt-and-suspenders: patch config.mk after configure in case CXX was still
  # empty (configure's version detection can fail on GCC > 6).
  sed -i "s|^CXX = .*|CXX = ${CXX:-g++}|" config.mk
  # -lfrtbegin/-lg2c are GCC 2/3 relics; modern Fortran only needs -lgfortran.
  sed -i 's|^FLIBS = .*|FLIBS = -lgfortran|' config.mk
  # Run targets sequentially: all four share the same tmp/ object directory, so
  # parallel top-level invocations cause races.  Pass JOBS to each sub-make.
  make lib_shared    ${JOBS:+-j $JOBS}
  make lib_archive   ${JOBS:+-j $JOBS}
  if grep -q "^EVTGEN_EXTERNAL = 1" config.mk; then
    make libext_shared  ${JOBS:+-j $JOBS}
    make libext_archive ${JOBS:+-j $JOBS}
  fi
}
