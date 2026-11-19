package: baurmc
description: baurmc BAUR Monte Carlo interface utility
version: "1.0"
tag: "1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/baurmc-1.0-src.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include FortranRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --lcgplatform=${BITS_PLATFORM:-linux} \
    --userfflags=-fno-automatic \
    ${baurmc_fflag} --enable-shared
}

function Make() {
  # GCC 15 errors on argument-rank mismatch (scalar vs rank-1 RANMAR); add
  # -fallow-argument-mismatch. baurmc has no standard FFLAGS var, so anchor on
  # -fno-automatic (from --userfflags) across all files that may carry it.
  perl -i -pe 's/-fno-automatic/-fno-automatic -fallow-argument-mismatch/g' \
    config.mk Makefile Makeshared.subdir Makearchive.subdir 2>/dev/null || true
  make ${JOBS:+-j $JOBS}
}

function MakeInstall() {
  # baurmc has no `install` target; install the built libraries (and headers if
  # any) manually.
  mkdir -p "$INSTALLROOT/lib"
  find . -maxdepth 4 \( -name 'lib*.so*' -o -name 'lib*.a' \) \
    -exec cp -p {} "$INSTALLROOT/lib/" \; 2>/dev/null || true
  if [ -d include ]; then
    mkdir -p "$INSTALLROOT/include"
    cp -rp include/. "$INSTALLROOT/include/"
  fi
  return 0
}