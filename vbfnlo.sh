package: vbfnlo
description: VBFNLO NLO Monte Carlo generator for vector boson fusion and associated processes
version: "3.0"
tag: "3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/vbfnlo-3.0.tgz
requires:
  - GSL
  - lhapdf
  - looptools
  - feynhiggs
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Touch the generated header so configure does not fail if it is missing
  cmake -E touch utilities/VBFNLOConfig.h.in 2>/dev/null || \
    mkdir -p utilities && touch utilities/VBFNLOConfig.h.in
  ./configure --prefix="$INSTALLROOT" \
    ${GSL_ROOT:+--with-gsl="$GSL_ROOT"} \
    ${LHAPDF_ROOT:+--with-LHAPDF="$LHAPDF_ROOT"} \
    ${LOOPTOOLS_ROOT:+--with-LOOPTOOLS="$LOOPTOOLS_ROOT"} \
    "FCFLAGS=-std=legacy"
}
