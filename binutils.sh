package: binutils
description: GNU Binutils binary tools (assembler, linker, nm, etc.)
version: "2.28"
tag: "2.28"
sources:
  - http://lcgpackages.web.cern.ch/lcgpackages/tarFiles/sources/binutils-2.28.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  $SOURCEDIR/configure --prefix=$INSTALLROOT --enable-ld=default --with-system-zlib --disable-shared --enable-plugins --enable-gprofng=no --enable-gold
}
