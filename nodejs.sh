package: nodejs
description: nodejs library/tool (from LCG software stack)
version: "22.14.0"
tag: "22.14.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/node-v22.14.0.tar.gz
requires:
  - Python
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
  $SOURCEDIR/configure --prefix $INSTALLROOT
}
