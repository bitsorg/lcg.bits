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
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Build against HepMC3 only (libTauolaCppHepMC3 / TAUOLAPP_HEPMC3), required by
  # cepgen's PhotosTauola wrapper and EvtGen 2.x. lcgcmake builds tauola++ with
  # exactly one HepMC flavour: passing both --with-hepmc (HepMC2) and
  # --with-hepmc3 did not produce the HepMC3 interface library. Mirror lcgcmake's
  # modern config: --with-hepmc3 + --without-hepmc.
  ./configure --prefix=$INSTALLROOT \
    --with-pic \
    --with-tau-spinner \
    --without-hepmc \
    --with-hepmc3="${HEPMC3_ROOT}" \
    ${LHAPDF_ROOT:+--with-lhapdf="${LHAPDF_ROOT}"}
}
function Make() {
  # macOS: libTauolaFortran references Fortran routines (_choice_, _dcdmas_, ...)
  # defined in a sibling TAUOLA library, resolved at load time. Linux's flat
  # namespace allows such undefined symbols in a shared library; macOS's
  # two-level namespace rejects them at link. The bundled libtool left
  # allow_undefined_flag="" (its MACOSX_DEPLOYMENT_TARGET version case does not
  # match 14.0), so the dylib link omits the flag. Patch the generated libtool to
  # allow undefined symbols (dynamic_lookup), matching Linux. Idempotent; Linux
  # has no such libtool lines to match.
  if [ "$(uname)" = Darwin ]; then
    find . -name libtool -type f -exec perl -i -pe \
      's/^allow_undefined_flag=""\s*$/allow_undefined_flag="-undefined dynamic_lookup"/' {} +
  fi
  make ${JOBS:+-j $JOBS}
}
