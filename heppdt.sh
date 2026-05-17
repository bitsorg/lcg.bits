package: HepPDT
description: HEP Particle Data Table library for particle properties
version: "2.06.01"
tag: "2.06.01"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/HepPDT-2.06.01.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
patches:
  - HepPDT-2.06.01.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  $SOURCEDIR/configure --prefix $INSTALLROOT  CXX=$CXX
}
