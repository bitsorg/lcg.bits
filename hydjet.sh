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
  ${FC:-gfortran} $fflags -c hydjet1_8.f -o hydjet.o
  ${FC:-gfortran} $fflags -shared -o libhydjet.so hydjet.o
  ${AR:-ar} crs libhydjet.a hydjet.o

  ${FC:-gfortran} $fflags -c jetset_73.f -o jetset.o
  ${FC:-gfortran} $fflags -shared -o libjetset73hydjet.so jetset.o
  ${AR:-ar} crs libjetset73hydjet.a jetset.o
}

function MakeInstall() {
  install -dm755 "$INSTALLROOT/lib"
  install -m755 libhydjet.so "$INSTALLROOT/lib/"
  install -m644 libhydjet.a  "$INSTALLROOT/lib/"
  install -m755 libjetset73hydjet.so "$INSTALLROOT/lib/"
  install -m644 libjetset73hydjet.a  "$INSTALLROOT/lib/"
}
