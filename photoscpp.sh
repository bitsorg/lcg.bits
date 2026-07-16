package: photoscpp
description: PHOTOS++ C++ version of PHOTOS radiative corrections
version: "3.64"
tag: "3.64"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/PHOTOS.3.64-LHC.tar.gz
requires:
  - hepmc3
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
acknowledgment: "PHOTOS++ — Copyright (c) the PHOTOS++ authors. Distributed under the MIT License."
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Log.h's convenience overload does `Fatal(NULL,code)`, calling
  # Fatal(std::string text, ...). Constructing std::string from NULL is the
  # deleted basic_string(nullptr_t) overload in C++23, so any consumer that
  # instantiates it (e.g. kkmcee's ROOT dictionary) fails to compile. Pass an
  # empty string instead. (The char* Assert(...,NULL) default is unaffected.)
  #
  # AutoToolsRecipe's Prepare() rsyncs SOURCEDIR into the build dir (cwd) and
  # ./configure builds *that* copy, so patch the copy under cwd, not SOURCEDIR.
  # perl -i (not sed -i) so the in-place edit is portable across GNU and BSD sed.
  find . -path '*utilities/Log.h' -exec perl -i -pe 's/Fatal\(NULL,code\)/Fatal("",code)/' {} + 2>/dev/null || true
  # Build against HepMC3 only (libPhotosppHepMC3), required by kkmcee, cepgen and
  # EvtGen 2.x. lcgcmake builds photos++ with exactly one HepMC flavour: passing
  # both --with-hepmc (HepMC2) and --with-hepmc3 did not produce the HepMC3
  # interface library, so consumers could not find libPhotosppHepMC3. Mirror
  # lcgcmake's modern config: --with-hepmc3 + --without-hepmc.
  ./configure --prefix="${INSTALLROOT}" \
    --with-hepmc3="${HEPMC3_ROOT}" \
    --without-hepmc \
    CFLAGS=-O2 FFLAGS=-O2 F77="${FC:-gfortran}" CXXFLAGS="-O2"
}

function Make() {
  # macOS: libPhotosppHepMC3 references HepMC3 symbols resolved at load time when
  # the consumer (which links HepMC3) pulls it in. Linux's flat namespace allows
  # such undefined symbols in a shared library; macOS's two-level namespace
  # rejects them at link. Patch the generated libtool to allow undefined symbols
  # (dynamic_lookup), matching Linux. Darwin-gated; Linux has no such lines.
  if [ "$(uname)" = Darwin ]; then
    find . -name libtool -type f -exec perl -i -pe \
      's/^allow_undefined_flag=""\s*$/allow_undefined_flag="-undefined dynamic_lookup"/' {} +
  fi
  make ${JOBS:+-j $JOBS}
}
