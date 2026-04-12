package: libxslt
description: GNOME XSLT processing library
version: "1.1.38"
tag: "1.1.38"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libxslt-1.1.38.tar.gz
requires:
  - libxml2
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT --without-python
}
