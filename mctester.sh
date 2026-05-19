package: mctester
description: MC-TESTER toolkit for comparisons of Monte Carlo generators
version: "1.25.1"
tag: "1.25.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/MC-TESTER-1.25.1.tar.gz
requires:
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-MCTester
patches:
  - mctester-1.25.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --with-root=${ROOT_ROOT}/bin "CFLAGS=-O2 -g0" "CXXFLAGS=-O2 -g0" "FFLAGS=-O2 -g0"
}
