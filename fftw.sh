package: fftw
description: FFTW fast discrete Fourier transform library
version: "3.3.10"
tag: "3.3.10"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fftw-3.3.10.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --enable-shared --enable-threads
}
