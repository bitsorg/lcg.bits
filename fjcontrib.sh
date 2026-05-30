package: fjcontrib
description: FastJet contrib package collection of add-on jet tools
version: "1.102"
tag: "1.102"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - fastjet
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --fastjet-config=${FASTJET_ROOT}/bin/fastjet-config
}
function Make() {
  # Build the static contrib libs and the "fragile" shared library
  # (libfastjetcontribfragile.so).  Rivet links -lfastjetcontribfragile, so the
  # shared variant must exist; the default `make` only produces the static lib.
  # Mirrors lcgcmake's fjcontrib: `make all` + `make fragile-shared`.
  make ${JOBS:+-j $JOBS}
  make fragile-shared
}
function MakeInstall() {
  make install
  make fragile-shared-install
}
