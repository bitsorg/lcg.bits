package: prophecy4f
description: Prophecy4f NLO EW corrections for H→4 fermions
version: "3.0.2"
tag: "3.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/Prophecy4f-3.0.2.tar.gz
requires:
  - collier
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-Prophecy4f
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS} \
    FC="${FC:-gfortran}" \
    COLLIERDIR="${COLLIER_ROOT}/lib" \
    INPUT="-I${COLLIER_ROOT}/include/"
}
function MakeInstall() {
  install -dm755 "${INSTALLROOT}/bin"
  # "any execute bit set" is spelled differently by GNU vs BSD find: GNU uses
  # `-perm /111`, BSD/macOS uses `-perm +111` (and rejects /111 as an "illegal
  # mode string"). GNU find in turn no longer accepts +111. Pick per platform;
  # Linux keeps the exact /111 form.
  local _perm=/111
  bits_is_macos && _perm=+111
  find . -maxdepth 2 -type f -perm "$_perm" ! -name '*.so' \
    -exec install -m755 {} "${INSTALLROOT}/bin/" \;
}
