package: qgraf
description: QGRAF automatic Feynman diagram generator for perturbative calculations
version: "3.1.4"
tag: "3.1.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-QGRAF
# Redistribution cleared: ATLAS, LHCb and CMS already distribute it on CVMFS (2026-10-19).
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Make() {
  ${FC:-gfortran} -o qgraf qgraf-3.1.4.f
}
function MakeInstall() {
  mkdir -p "$INSTALLROOT/bin"
  cp qgraf "$INSTALLROOT/bin/"
}
