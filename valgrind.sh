package: valgrind
description: Valgrind dynamic analysis framework for memory and threading
version: "3.26.0"
tag: "3.26.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/valgrind-3.26.0.tar.bz2
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
  autoreconf --install --force COMMAND chmod +x ./configure COMMAND ./configure --prefix=$INSTALLROOT
}
