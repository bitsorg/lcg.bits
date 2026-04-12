package: motif
description: motif library/tool (from LCG software stack)
version: "2.3.8"
tag: "2.3.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/motif-2.3.8.tar.gz
requires:
  - fontconfig
  - flex
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - motif-2.3.8.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  $SOURCEDIR/configure --disable-printing --prefix $INSTALLROOT
}
