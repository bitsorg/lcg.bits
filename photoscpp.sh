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
license: LicenseRef-PHOTOS++
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # C++23 deletes basic_string(nullptr_t), so Log.h's Fatal(NULL,code) overload
  # breaks consumers (e.g. kkmcee's ROOT dict). Pass "" instead. Patch the build
  # copy under cwd (AutoToolsRecipe rsyncs SOURCEDIR here).
  find . -path '*utilities/Log.h' | while read -r _f; do
    bits_file_replace "$_f" 'Fatal(NULL,code)' 'Fatal("",code)'
  done
  # HepMC3 only (libPhotosppHepMC3), as lcgcmake: build a single HepMC flavour.
  ./configure --prefix="${INSTALLROOT}" \
    --with-hepmc3="${HEPMC3_ROOT}" \
    --without-hepmc \
    CFLAGS=-O2 FFLAGS=-O2 F77="${FC:-gfortran}" CXXFLAGS="-O2"
}
function Make() {
  # macOS: libPhotosppHepMC3 references HepMC3 symbols resolved at load time;
  # the two-level namespace rejects undefined symbols at link, so allow them
  # (dynamic_lookup) as Linux's flat namespace does.
  bits_patch_libtool_undefined
  make ${JOBS:+-j $JOBS}
}
