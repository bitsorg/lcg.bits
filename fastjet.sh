package: fastjet
description: Package for jet finding in hadron and e+e- collisions
version: "3.5.1"
tag: "3.5.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fastjet-3.5.1.tar.gz
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
  $SOURCEDIR/configure --prefix=$INSTALLROOT --enable-shared --enable-allplugins --disable-auto-ptr --enable-limited-thread-safety --enable-thread-safety
}
