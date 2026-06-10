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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # g77 (GNU Fortran 77) was retired; modern GCC provides gfortran instead.
  export F77=${FC:-gfortran}
  # Replace hardcoded g77 in configure and generated build files before
  # running configure so Makeshared.subdir / Makearchive.subdir are correct.
  grep -rl "g77" . | grep -Ev '\.(f|F|f90|F90|for|FOR)$' | \
    xargs perl -i -pe "s/\bg77\b/${F77}/g"
  ./configure --lcgplatform=${BITS_PLATFORM:-linux} \
    --userfflags=-fno-automatic \
    ${baurmc_fflag} --enable-shared
}

function Make() {
  # Belt-and-suspenders: replace any g77 still present in generated files.
  grep -rl "g77" . | grep -Ev '\.(f|F|f90|F90|for|FOR)$' | \
    xargs perl -i -pe "s/\bg77\b/${F77}/g"
  # GCC 15 errors on argument-rank mismatch (scalar vs rank-1 RANMAR); add
  # -fallow-argument-mismatch. baurmc has no standard FFLAGS var, so anchor on
  # -fno-automatic (from --userfflags) across all files that may carry it.
  perl -i -pe 's/-fno-automatic/-fno-automatic -fallow-argument-mismatch/g' \
    config.mk Makefile Makeshared.subdir Makearchive.subdir 2>/dev/null || true
  # macOS: rewrite Makeshared.subdir's ELF shared-lib link (-shared -Wl,-soname,
  # which Apple ld rejects, and which leaves libgfortran symbols undefined) to
  # macOS conventions (-dynamiclib + dynamic_lookup + headerpad).
  bits_is_macos && bits_file_sub Makeshared.subdir '-shared -Wl,-soname,.*$' \
    '-dynamiclib -Wl,-undefined,dynamic_lookup -Wl,-headerpad_max_install_names'
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