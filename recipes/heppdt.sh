package: HepPDT
description: HEP Particle Data Table library for particle properties
version: "2.06.01"
source: https://github.com/fermitools/heppdt
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
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
