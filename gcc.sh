package: gcc
description: GNU Compiler Collection (C, C++, Fortran)
version: "6.2.0"
tag: "6.2.0"
sources:
  - http://lcgpackages.web.cern.ch/lcgpackages/tarFiles/sources/gcc/gcc-6.2.0.tar.gz
requires:
  - binutils
build_requires:
  - bits-recipe-tools
license: GPL-3.0-only
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  $SHELL -c "cd $SOURCEDIR && pwd && ls && bash contrib/download_prerequisites" COMMAND $SOURCEDIR/configure --prefix=$INSTALLROOT --disable-nls --with-system-zlib "--enable-languages=c,c++,fortran,lto,go" --with-gnu-ld --with-gnu-as --enable-__cxa_atexit --disable-libunwind-exceptions --enable-gnu-unique-object --enable-plugin --with-linker-hash-style=gnu --enable-linker-build-id --enable-libstdcxx-time=rt --enable-shared --disable-libgcj
}