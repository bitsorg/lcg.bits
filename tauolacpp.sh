package: tauolacpp
description: TAUOLA++ C++ version of TAUOLA tau decay generator
version: "1.1.9"
tag: "1.1.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/TAUOLA.1.1.9-LHC.tar.gz
requires:
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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # HepMC3 only (libTauolaCppHepMC3), as lcgcmake: build a single HepMC flavour.
  ./configure --prefix=$INSTALLROOT \
    --with-pic \
    --with-tau-spinner \
    --without-hepmc \
    --with-hepmc3="${HEPMC3_ROOT}" \
    ${LHAPDF_ROOT:+--with-lhapdf="${LHAPDF_ROOT}"}
}
function Make() {
  # macOS: libTauolaFortran references sibling-library Fortran routines resolved
  # at load time; the two-level namespace rejects undefined symbols at link, so
  # allow them (dynamic_lookup) as Linux's flat namespace does.
  bits_patch_libtool_undefined
  make ${JOBS:+-j $JOBS}
}
