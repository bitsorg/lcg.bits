package: libxml2
description: GNOME XML parsing library
version: "2.10.4"
tag: "2.10.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libxml2-2.10.4.tar.gz
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT --without-python --without-lzma
}
