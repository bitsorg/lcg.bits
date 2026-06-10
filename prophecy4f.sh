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
  # "any execute bit set" differs: GNU find wants `-perm /111`, BSD/macOS wants
  # `+111` (each rejects the other's form). Pick per platform.
  local _perm=/111
  bits_is_macos && _perm=+111
  find . -maxdepth 2 -type f -perm "$_perm" ! -name '*.so' \
    -exec install -m755 {} "${INSTALLROOT}/bin/" \;
}
