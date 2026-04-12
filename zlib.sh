package: zlib
description: zlib lossless data compression library
version: "1.3.2"
tag: "1.3.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/zlib-1.3.2.tar.gz
build_requires:
  - bits-recipe-tools
license: Zlib
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix $INSTALLROOT
}
