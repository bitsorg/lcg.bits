package: tauola++
description: TAUOLA++ C++ version of TAUOLA tau decay generator
version: "1.1.6"
tag: "1.1.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/TAUOLA.1.1.6-LHC.tar.gz
requires:
  - lhapdf
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-TAUOLA++
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --with-pic --with-tau-spinner --with-lhapdf=${LHAPDF_ROOT}
}
