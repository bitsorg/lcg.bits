package: GSL
description: GNU Scientific Library for numerical computations
version: "2.8"
source: https://github.com/alisw/gsl
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gsl-2.8.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --root-inc"
##############################
function Configure() {
  ./configure --prefix $INSTALLROOT ${GSL_config_options} CC=$CC CFLAGS=-O2
}
