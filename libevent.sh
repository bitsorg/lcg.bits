package: libevent
description: libevent library/tool (from LCG software stack)
version: "2.1.11"
tag: "2.1.11"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libevent-2.1.11.tar.gz
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
