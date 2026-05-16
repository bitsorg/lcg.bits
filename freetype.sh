package: freetype
description: FreeType scalable font rendering engine
version: "2.14.3"
tag: "2.14.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/freetype-2.14.3.tar.gz
requires:
  - zlib
build_requires:
  - bits-recipe-tools
license: FTL OR GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix $INSTALLROOT --with-pic --with-png=no --with-bzip2=no --with-harfbuzz=no CC=$CC CFLAGS=-O
}
