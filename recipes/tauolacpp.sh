package: tauolacpp
description: TAUOLA++ C++ version of TAUOLA tau decay generator
version: "1.1.9.atlas1"
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
patches:
  # Version-gated: ATLAS vs LHCb source patches to the same TAUOLA 1.1.9 tarball.
  - "tauola++-1.1.9.atlas1.patch:version=1.1.9.atlas1 && strip=0"
  - "tauola++-1.1.9.lhcb.patch:version=1.1.9.lhcb && strip=0"
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsMacOS)
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
  # macOS: libTauolaFortran leaves sibling-library Fortran routines undefined
  # (resolved at load time); let the generated libtool emit dylibs with them.
  bits_patch_libtool_undefined
  make ${JOBS:+-j $JOBS}
}
