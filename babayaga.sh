package: babayaga
description: BabaYaga NLO Monte Carlo generator for e+e- radiative processes
version: "fcc1.0.0"
tag: "fcc1.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.bz2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-BabaYaga
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function MakeInstall() {
  mkdir -p "$INSTALLROOT/bin"
  chmod +x "$SOURCEDIR/babayaga-fcc"
  cp "$SOURCEDIR/babayaga-fcc" "$INSTALLROOT/bin/"
}
