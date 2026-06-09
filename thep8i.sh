package: thep8i
description: TheP8I Herwig/Pythia8 interface for combined parton shower models
version: "2.0.4"
tag: "2.0.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/TheP8I-2.0.4.tar.gz
requires:
  - thepeg
  - pythia8
  - GSL
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--lib"
##############################
function Configure() {
  # macOS: gated off — TheP8I builds against ThePEG, which is gated off on macOS
  # (its setupThePEG/runThePEG abort on the clang-21/macOS-26-SDK libc++ bug).
  # Produce an empty package; remove the guards to resume once ThePEG works.
  [ "$(uname)" = Darwin ] && { mkdir -p "$INSTALLROOT"; return 0; }
  export THEPEGPATH="$THEPEG_ROOT"
  [[ -n "$THEPEG_ROOT" ]] && export LD_LIBRARY_PATH="$THEPEG_ROOT/lib/ThePEG:$LD_LIBRARY_PATH"
  autoreconf -ivf
  ./configure --prefix="$INSTALLROOT" --libdir="$INSTALLROOT/lib64" \
    ${PYTHIA8_ROOT:+--with-pythia8="$PYTHIA8_ROOT"} \
    ${GSL_ROOT:+--with-gsl="$GSL_ROOT"}
}
function Make() {
  [ "$(uname)" = Darwin ] && return 0
  make ${JOBS:+-j $JOBS}
}
function MakeInstall() {
  [ "$(uname)" = Darwin ] && return 0
  make install
}
