package: hydjet
description: HYDJET heavy-ion event generator for jet quenching studies
version: "1.8"
tag: "1.8"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-HYDJET
# academic-use licence with no redistribution grant (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: false
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--lib"
##############################
function Prepare() {
  # The hydjet tar contains two bare Fortran files at the archive root (no
  # wrapping directory).  bits would extract with --strip-components=1, which
  # skips files with no directory prefix.  Download and extract manually.
  curl -fSL \
    "https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/hydjet1_8.tar" \
    | tar xf - -C ./
}

function Make() {
  # -std=legacy matches lcgcmake; needed for the old Fortran-77 code
  local fflags="-std=legacy -O2 -fPIC"
  # macOS: build .dylib with -dynamiclib; allow flat-namespace lazy resolution for cross-lib JETSET/PYTHIA refs
  local _so=so _shared=-shared _undef=
  if bits_is_macos; then _so=dylib; _shared=-dynamiclib; _undef="$(bits_macos_undefined_ldflags)"; fi
  ${FC:-gfortran} $fflags -c hydjet1_8.f -o hydjet.o
  ${FC:-gfortran} $fflags $_shared $_undef -o libhydjet.$_so hydjet.o
  ${AR:-ar} crs libhydjet.a hydjet.o

  ${FC:-gfortran} $fflags -c jetset_73.f -o jetset.o
  ${FC:-gfortran} $fflags $_shared $_undef -o libjetset73hydjet.$_so jetset.o
  ${AR:-ar} crs libjetset73hydjet.a jetset.o
}

function MakeInstall() {
  local _so=so; bits_is_macos && _so=dylib
  install -dm755 "$INSTALLROOT/lib"
  install -m755 libhydjet.$_so "$INSTALLROOT/lib/"
  install -m644 libhydjet.a  "$INSTALLROOT/lib/"
  install -m755 libjetset73hydjet.$_so "$INSTALLROOT/lib/"
  install -m644 libjetset73hydjet.a  "$INSTALLROOT/lib/"
}
