package: hydjet
description: HYDJET heavy-ion event generator for jet quenching studies
version: "1.8"
tag: "1.8"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-HYDJET
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
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
  # -std=legacy matches the flag used by lcgcmake; needed for old Fortran-77 code
  local fflags="-std=legacy -O2 -fPIC"
  # macOS shared libraries are .dylib built with -dynamiclib, not .so/-shared.
  # libhydjet references JETSET/PYTHIA routines (pyevnt_, pyinit_, gauss_, ...)
  # that live in the other library; macOS's two-level namespace rejects such
  # undefined symbols in a dylib, whereas Linux's flat namespace allows them.
  # Allow flat-namespace lazy resolution (matching the ELF behaviour) on macOS.
  # -headerpad_max_install_names reserves space in the Mach-O header so bits'
  # relocate-me.sh can rewrite the (short) LC_ID_DYLIB install name to the long
  # absolute store path via install_name_tool — without it the unpack/relocate
  # step fails ("larger updated load commands do not fit").
  local _so=so _shared=-shared _undef=
  if [ "$(uname)" = Darwin ]; then _so=dylib; _shared=-dynamiclib; _undef="-Wl,-undefined,dynamic_lookup -Wl,-headerpad_max_install_names"; fi
  ${FC:-gfortran} $fflags -c hydjet1_8.f -o hydjet.o
  ${FC:-gfortran} $fflags $_shared $_undef -o libhydjet.$_so hydjet.o
  ${AR:-ar} crs libhydjet.a hydjet.o

  ${FC:-gfortran} $fflags -c jetset_73.f -o jetset.o
  ${FC:-gfortran} $fflags $_shared $_undef -o libjetset73hydjet.$_so jetset.o
  ${AR:-ar} crs libjetset73hydjet.a jetset.o
}

function MakeInstall() {
  local _so=so; [ "$(uname)" = Darwin ] && _so=dylib
  install -dm755 "$INSTALLROOT/lib"
  install -m755 libhydjet.$_so "$INSTALLROOT/lib/"
  install -m644 libhydjet.a  "$INSTALLROOT/lib/"
  install -m755 libjetset73hydjet.$_so "$INSTALLROOT/lib/"
  install -m644 libjetset73hydjet.a  "$INSTALLROOT/lib/"
}
