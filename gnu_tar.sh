package: gnu_tar
description: gnu_tar library/tool (from LCG software stack)
version: "1.30"
tag: "1.30"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tar-1.30.tar.gz
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
