package: photoscpp
description: PHOTOS++ C++ version of PHOTOS radiative corrections
version: "3.64"
source: https://gitlab.cern.ch/photospp/photospp
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/PHOTOS.3.64-LHC.tar.gz
requires:
  - hepmc3
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
acknowledgment: "MIT License - Copyright (c) [year] PHOTOS++ authors."
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Log.h's `Fatal(NULL,code)` builds std::string from NULL (deleted nullptr_t overload
  # in C++23), breaking consumers like kkmcee's dictionary; pass an empty string instead.
  # Patch the build copy under cwd (Prepare rsyncs SOURCEDIR there); perl -i for portability.
  find . -path '*utilities/Log.h' -exec perl -i -pe 's/Fatal\(NULL,code\)/Fatal("",code)/' {} + 2>/dev/null || true
  # Build against HepMC3 only (libPhotosppHepMC3), required by kkmcee/cepgen/EvtGen 2.x.
  # photos++ supports one HepMC flavour, so use --with-hepmc3 + --without-hepmc
  # (passing both dropped the HepMC3 interface lib).
  ./configure --prefix="${INSTALLROOT}" \
    --with-hepmc3="${HEPMC3_ROOT}" \
    --without-hepmc \
    CFLAGS=-O2 FFLAGS=-O2 F77="${FC:-gfortran}" CXXFLAGS="-O2"
}

function Make() {
  # macOS: libPhotosppHepMC3 leaves HepMC3 symbols undefined (resolved at load time by the
  # consumer). macOS's two-level namespace rejects that at link, so patch libtool to allow
  # undefined symbols (dynamic_lookup). Darwin-gated; Linux has no such lines.
  if [ "$(uname)" = Darwin ]; then
    find . -name libtool -type f -exec perl -i -pe \
      's/^allow_undefined_flag=""\s*$/allow_undefined_flag="-undefined dynamic_lookup"/' {} +
  fi
  make ${JOBS:+-j $JOBS}
}
