package: flex
description: GNU Flex fast lexical analyser generator
version: "2.6.4"
tag: "2.6.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/flex-2.6.4.tar.gz
requires:
  - bison
build_requires:
  - bits-recipe-tools
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  $SOURCEDIR/configure --prefix $INSTALLROOT
}
