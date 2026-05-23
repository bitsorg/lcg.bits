package: tauola
description: TAUOLA Monte Carlo generator for tau lepton decays
version: "28.121.2"
tag: "28.121.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/tauola-28.121.2-src.tgz
requires:
  - photos
  - pythia6
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-TAUOLA
patches:
  - tauola-28.121.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Prepare() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # configure does `ARCH=$(uname)` → "Linux" → FC=g77 (GCC 3.x, gone).
  # Redirect "Linux" to "Linux-gcc4" so the gfortran branch is taken instead,
  # and fix the obsolete FLIBS while we're here.
  sed -i \
    -e 's/^export ARCH="`uname`"$/export ARCH="`uname`"\n[ "$ARCH" = Linux ] \&\& ARCH=Linux-gcc4/' \
    -e 's/export FLIBS="-lfrtbegin -lg2c"/export FLIBS="-lgfortran"/' \
    configure
}

function Configure() {
  export COMPMODE=OPT
  ./configure --prefix="$INSTALLROOT" --datadir="$INSTALLROOT/data"
}
