package: mpich2
description: mpich2 library/tool (from LCG software stack)
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mpich2-unknown.tar.gz
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
  ./configure --prefix=$INSTALLROOT --enable-shared --enable-sharedlibs=gcc --with-pm=mpd "CFLAGS=-O2 -g0 -fPIC"
}
