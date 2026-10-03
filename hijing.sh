package: hijing
description: HIJING heavy-ion jet interaction generator
version: "1.383bs.2"
tag: "1.383bs.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/hijing-1.383bs.2-src.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-HIJING
# academic-use licence with no redistribution grant (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: none
patches:
  - "hijing-1.383bs.2.patch:version=1.383bs.2"
  - "hijing-1.383bs.2.atlas20260625.patch:version=1.383bs.2.atlas20260625 && strip=0"
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include FortranRecipe)
##############################
MODULE_OPTIONS="--lib"
##############################
function Configure() {
  # HIJING configure does not understand --prefix (prints "wrong option.
  # Ignored." and continues), so we install manually in Make().
  ./configure
}

function Make() {
  make ${JOBS:+-j $JOBS}
}

function MakeInstall() {
  # HIJING's Makefile has no 'install' target and configure ignored --prefix,
  # so the default `make install` fails ("No rule to make target 'install'").
  # Install the built library (and optional COMMON-block headers) manually.
  mkdir -p "${INSTALLROOT}/lib"
  cp -p lib/libhijing.* "${INSTALLROOT}/lib/"
  # Fortran COMMON-block include files, if the tarball ships them.  Use an
  # if-block (not `[[ ]] && {...}`) so a missing include/ dir does not make
  # MakeInstall() return non-zero and abort the build under `set -e`.
  if [[ -d include ]]; then
    mkdir -p "${INSTALLROOT}/include"
    cp -rp include/. "${INSTALLROOT}/include/"
  fi
}
