package: libedit
description: libedit library/tool (from LCG software stack)
version: "3.1"
tag: "3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libedit-3.1.tar.gz
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
  ./configure --prefix $INSTALLROOT
}
