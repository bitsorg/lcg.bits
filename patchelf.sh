package: patchelf
description: patchelf library/tool (from LCG software stack)
version: "0.12"
tag: "0.12"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/patchelf-0.12.tar.gz
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
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./bootstrap.sh COMMAND ./configure --prefix=$INSTALLROOT
}
