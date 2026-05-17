package: gdb
description: GNU Debugger for C, C++, Fortran, and other languages
version: "17.2"
tag: "17.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gdb-17.2.tar.gz
requires:
  - texinfo
  - Python
  - gmp
  - mpfr
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  $SOURCEDIR/configure --prefix=$INSTALLROOT  --enable-install-libiberty
}
