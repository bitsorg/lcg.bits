package: ofi
description: ofi library/tool (from LCG software stack)
version: "1.22.0"
tag: "1.22.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libfabric-1.22.0).tar.bz2
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
  ./configure --enable-mlx=no --prefix=$INSTALLROOT
}
