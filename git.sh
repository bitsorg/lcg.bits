package: git
description: git library/tool (from LCG software stack)
version: "2.49.0"
tag: "2.49.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/git-2.49.0.tar.gz
requires:
  - curl
  - expat
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
  make ${JOBS:+-j $JOBS} configure COMMAND ./configure --prefix=$INSTALLROOT --with-openssl --with-curl --with-expat --with-tcltk
}
