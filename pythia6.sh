package: pythia6
description: Pythia 6 Monte Carlo event generator (legacy Fortran version)
version: "6.4.28.snd"
tag: "6.4.28.snd"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-Pythia6
# academic-use licence with no redistribution grant (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: false
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--lib"
##############################
function Prepare() {
  # Single compressed Fortran file; bits cannot untar a bare .f.gz.
  # Download and decompress manually.
  curl -fSL \
    "https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/pythia-6.4.28.f.gz" \
    | gunzip > pythia6.f
}

function Make() {
  local fflags="-std=legacy -fallow-argument-mismatch -O2 -fPIC"
  # macOS: PYTHIA6's dylib references external PDF routines (structm_, pdfset_, ...) not in
  # the object, which the two-level namespace rejects, so allow flat-namespace lazy
  # resolution. -headerpad_max_install_names reserves header space for bits' relocation.
  local _so=so _shared=-shared _undef=
  if [ "$(uname)" = Darwin ]; then
    _so=dylib; _shared=-dynamiclib
    _undef="-Wl,-undefined,dynamic_lookup -Wl,-headerpad_max_install_names"
  fi
  ${FC:-gfortran} $fflags -c pythia6.f -o pythia6.o
  ${FC:-gfortran} $fflags $_shared $_undef -o libpythia6.$_so pythia6.o
  ${AR:-ar} crs libpythia6.a pythia6.o
}

function MakeInstall() {
  local _so=so; [ "$(uname)" = Darwin ] && _so=dylib
  install -dm755 "$INSTALLROOT/lib"
  install -m755 libpythia6.$_so "$INSTALLROOT/lib/"
  install -m644 libpythia6.a  "$INSTALLROOT/lib/"
}
