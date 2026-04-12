package: fftw
description: fftw library/tool (from LCG software stack)
version: "3.3.10"
tag: "3.3.10"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fftw-3.3.10.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT --enable-shared
  make install
}
