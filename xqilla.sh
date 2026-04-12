package: xqilla
description: xqilla library/tool (from LCG software stack)
version: "2.3.4"
tag: "2.3.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/XQilla-2.3.4.tar.gz
requires:
  - XercesC
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
  ./configure --prefix=$INSTALLROOT --with-xerces=${XercesC_ROOT} --disable-rpath
}
