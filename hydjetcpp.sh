package: hydjetcpp
description: HYDJET++ improved heavy-ion Monte Carlo generator with jet quenching
version: "2.1"
tag: "2.1"
requires:
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-HYDJET++
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Prepare() {
  # The HYDJET++ ZIP has all files directly at the archive root (no wrapping
  # directory).  bits would extract with strip=1 and skip root-level files.
  # Download and unzip manually with strip=0.
  curl -fSL \
    "https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/HYDJET++2_1.ZIP" \
    -o HYDJET++2_1.ZIP
  unzip -q HYDJET++2_1.ZIP
  rm -f HYDJET++2_1.ZIP
}

function Configure() {
  # The configure script only generates config.mk — no autoconf
  export COMPMODE=OPT
  ./configure
}
function Make() {
  PATH="${ROOT_ROOT:+$ROOT_ROOT/bin:}$PATH" \
    make ${JOBS:+-j $JOBS} F77LIBSO="${FORTRAN_LIBRARY:-}"
}
function MakeInstall() {
  mkdir -p "$INSTALLROOT/bin" "$INSTALLROOT/lib" "$INSTALLROOT/share"
  cp HYDJET RunInputHydjet "$INSTALLROOT/bin/"
  cp lib/libhydjet++.so "$INSTALLROOT/lib/" 2>/dev/null || true
  cp lib/archive/libhydjet++.a "$INSTALLROOT/lib/" 2>/dev/null || true
  cp -r RootMacros "$INSTALLROOT/share/"
}
