package: qgraf
description: QGRAF automatic Feynman diagram generator for perturbative calculations
version: "3.1.4"
tag: "3.1.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/qgraf-3.1.4.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-QGRAF
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Make() {
  $FC -o qgraf qgraf-3.1.4.f
}
function MakeInstall() {
  mkdir -p "$INSTALLROOT/bin"
  cp qgraf "$INSTALLROOT/bin/"
}
