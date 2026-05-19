package: R
description: R statistical computing language and environment
version: "4.5.0"
tag: "4.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/R-4.5.0.tar.gz
requires:
  - fribidi
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --disable-R-framework --enable-R-shlib --without-x --with-cairo --with-libpng --with-libtiff --with-jpeglib
}
