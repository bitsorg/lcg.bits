package: readline
description: readline library/tool (from LCG software stack)
version: "8.0"
tag: "8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/readline-8.0.tar.gz
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
