package: pythia6
description: Pythia 6 Monte Carlo event generator (legacy Fortran version)
version: "6.4.28.snd"
tag: "6.4.28.snd"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-Pythia6
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
. $(bits-include BitsMacOS)
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
  # macOS shared libraries are .dylib built with -dynamiclib, not .so/-shared.
  # PYTHIA6 references external PDF routines (structm_, pdfset_, ...) not in this
  # object; macOS's two-level namespace rejects such undefined symbols in a dylib
  # whereas Linux's flat namespace allows them. Allow flat-namespace lazy
  # resolution on macOS (matching the ELF behaviour).
  # -headerpad_max_install_names reserves Mach-O header space so bits'
  # relocate-me.sh can rewrite the LC_ID_DYLIB install name to the long store
  # path via install_name_tool (else the unpack/relocate step fails).
  local _so=so _shared=-shared _undef=
  if bits_is_macos; then _so=dylib; _shared=-dynamiclib; _undef="$(bits_macos_undefined_ldflags)"; fi
  ${FC:-gfortran} $fflags -c pythia6.f -o pythia6.o
  ${FC:-gfortran} $fflags $_shared $_undef -o libpythia6.$_so pythia6.o
  ${AR:-ar} crs libpythia6.a pythia6.o
}

function MakeInstall() {
  local _so=so; bits_is_macos && _so=dylib
  install -dm755 "$INSTALLROOT/lib"
  install -m755 libpythia6.$_so "$INSTALLROOT/lib/"
  install -m644 libpythia6.a  "$INSTALLROOT/lib/"
}
