package: gnu_sed
description: gnu_sed library/tool (from LCG software stack)
version: "4.5"
tag: "4.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sed-4.5.tar.gz
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
