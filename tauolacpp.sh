package: tauolacpp
description: TAUOLA++ C++ version of TAUOLA tau decay generator
version: "1.1.9"
source: https://github.com/Malexandra-de/Tauolapp
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/TAUOLA.1.1.9-LHC.tar.gz
requires:
  - hepmc3
  - lhapdf
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-only
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Build against HepMC3 only (libTauolaCppHepMC3), required by cepgen's PhotosTauola and
  # EvtGen 2.x. tauola++ supports one HepMC flavour, so use --with-hepmc3 + --without-hepmc
  # (passing both dropped the HepMC3 interface lib).
  ./configure --prefix=$INSTALLROOT \
    --with-pic \
    --with-tau-spinner \
    --without-hepmc \
    --with-hepmc3="${HEPMC3_ROOT}" \
    ${LHAPDF_ROOT:+--with-lhapdf="${LHAPDF_ROOT}"}
}

function Make() {
  # macOS: libTauolaFortran leaves sibling-library Fortran routines undefined (resolved at
  # load time), which the two-level namespace rejects at link; patch libtool to allow
  # undefined symbols (dynamic_lookup). Darwin-gated; Linux has no such lines.
  if [ "$(uname)" = Darwin ]; then
    find . -name libtool -type f -exec perl -i -pe \
      's/^allow_undefined_flag=""\s*$/allow_undefined_flag="-undefined dynamic_lookup"/' {} +
  fi
  make ${JOBS:+-j $JOBS}
}
