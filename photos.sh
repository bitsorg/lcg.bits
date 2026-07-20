package: photos
description: PHOTOS Monte Carlo for radiative corrections in decays
version: "215.4"
tag: "215.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/photos-215.4-src.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-PHOTOS
# CPC Program Library non-profit licence — no redistribution grant (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: false
patches:
  - %(name)s-%(version)s.patch
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
  # Patch configure before running it so the generated Makeshared.subdir
  # already references gfortran rather than the hardcoded g77.
  grep -rl "g77" . | grep -Ev '\.(f|F|f90|F90|for|FOR)$' | \
    xargs perl -i -pe "s/\bg77\b/${F77}/g"
  ./configure --lcgplatform=${BITS_PLATFORM:-linux} --userfflags=-fno-automatic --enable-shared
}

function Make() {
  # Belt-and-suspenders: replace any g77 remaining in generated build files.
  grep -rl "g77" . | grep -Ev '\.(f|F|f90|F90|for|FOR)$' | \
    xargs perl -i -pe "s/\bg77\b/${F77}/g"
  # macOS: the `-shared` link leaves libgfortran symbols undefined, which the
  # two-level namespace rejects. Add -undefined dynamic_lookup (+ headerpad).
  bits_is_macos && bits_file_sub Makeshared.subdir '-o \$\@ -shared\s*$' \
    '-o $@ -shared -Wl,-undefined,dynamic_lookup -Wl,-headerpad_max_install_names'
  make ${JOBS:+-j $JOBS}
}

function MakeInstall() {
  # PHOTOS has no 'make install' target; install manually.
  mkdir -p "${INSTALLROOT}/lib" "${INSTALLROOT}/include"
  cp -p lib/libphotos.so "${INSTALLROOT}/lib/"
  [[ -f lib/archive/libphotos.a ]] && cp -p lib/archive/libphotos.a "${INSTALLROOT}/lib/"
  [[ -d include ]] && cp -rp include/. "${INSTALLROOT}/include/"
}
