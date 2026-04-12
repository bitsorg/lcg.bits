package: libnuma
description: libnuma library/tool (from LCG software stack)
version: "2.0.19"
tag: "2.0.19"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/numactl-2.0.19.tar.gz
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
  ./configure prefix=$INSTALLROOT
}
