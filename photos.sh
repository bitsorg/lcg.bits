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
patches:
  - %(name)s-%(version)s.patch
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
  # macOS: Makeshared.subdir links libphotos with `$(CXX) ... -shared`, which does
  # not pull in libgfortran, so the Fortran objects' libgfortran runtime symbols
  # (__gfortran_st_write, ...) are undefined. Linux's flat namespace leaves them
  # undefined (resolved at runtime); macOS's two-level namespace rejects them.
  # Add -undefined dynamic_lookup to restore the Linux behaviour, plus
  # -headerpad_max_install_names so bits' relocate-me.sh can rewrite the install
  # name. Idempotent via the grep guard. Linux unchanged.
  if [ "$(uname)" = Darwin ] && ! grep -q 'dynamic_lookup' Makeshared.subdir; then
    perl -i -pe 's/-o \$\@ -shared\s*$/-o \$\@ -shared -Wl,-undefined,dynamic_lookup -Wl,-headerpad_max_install_names/' Makeshared.subdir
  fi
  make ${JOBS:+-j $JOBS}
}

function MakeInstall() {
  # PHOTOS has no 'make install' target; install manually.
  mkdir -p "${INSTALLROOT}/lib" "${INSTALLROOT}/include"
  cp -p lib/libphotos.so "${INSTALLROOT}/lib/"
  [[ -f lib/archive/libphotos.a ]] && cp -p lib/archive/libphotos.a "${INSTALLROOT}/lib/"
  [[ -d include ]] && cp -rp include/. "${INSTALLROOT}/include/"
}
