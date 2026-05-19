package: bhlumi
description: BHLUMI Monte Carlo generator for Bhabha scattering
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/bhlumi-unknown.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-BHLUMI
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  $SHELL -c "cd ./4.x-cpc && make -f makefile lhemain"
}
function MakeInstall() {
  mkdir -p "$INSTALLROOT/bin"
  chmod +x ./4.x-cpc/demo2.exe
  cp ./4.x-cpc/demo2.exe "$INSTALLROOT/bin/BHLUMI.exe"
  cp "${SOURCEDIR}/../bhlumi/BHLUMI" "$INSTALLROOT/bin/"
}