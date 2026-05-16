package: mpich2
description: MPICH2 high-performance MPI implementation
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mpich2-unknown.tar.gz
build_requires:
  - bits-recipe-tools
license: MIT-CMU
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
