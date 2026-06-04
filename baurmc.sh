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
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # g77 (GNU Fortran 77) was retired; modern GCC provides gfortran instead.
  export F77=${FC:-gfortran}
  # Replace hardcoded g77 in configure and generated build files before
  # running configure so Makeshared.subdir / Makearchive.subdir are correct.
  grep -rl "g77" . | grep -Ev '\.(f|F|f90|F90|for|FOR)$' | \
    xargs --no-run-if-empty sed -i "s/\bg77\b/${F77}/g"
  ./configure --lcgplatform=${BITS_PLATFORM:-linux} \
    --userfflags=-fno-automatic \
    ${baurmc_fflag} --enable-shared
}

function Make() {
  # Belt-and-suspenders: replace any g77 still present in generated files.
  grep -rl "g77" . | grep -Ev '\.(f|F|f90|F90|for|FOR)$' | \
    xargs --no-run-if-empty sed -i "s/\bg77\b/${F77}/g"
  # GCC 15 enforces argument rank consistency; allow the legacy Fortran
  # mismatch (scalar vs rank-1 RANMAR calls).  baurmc's LCG build system
  # does not use a standard FFLAGS variable; anchor the injection on
  # -fno-automatic (set via --userfflags in Configure) which we know
  # appears in the compile command regardless of the variable name used.
  # configure writes the final FFLAGS value to config.mk (not Makefile).
  # Patch all files that may carry -fno-automatic.
  sed -i 's/-fno-automatic/-fno-automatic -fallow-argument-mismatch/g' \
    config.mk Makefile Makeshared.subdir Makearchive.subdir 2>/dev/null || true
  make ${JOBS:+-j $JOBS}
}

function MakeInstall() {
  # baurmc's LCG build system has no `install` target (default `make install`
  # fails with "No rule to make target 'install'"); install the built libraries
  # (and headers if any) manually.
  mkdir -p "$INSTALLROOT/lib"
  find . -maxdepth 4 \( -name 'lib*.so*' -o -name 'lib*.a' \) \
    -exec cp -p {} "$INSTALLROOT/lib/" \; 2>/dev/null || true
  if [ -d include ]; then
    mkdir -p "$INSTALLROOT/include"
    cp -rp include/. "$INSTALLROOT/include/"
  fi
  return 0
}