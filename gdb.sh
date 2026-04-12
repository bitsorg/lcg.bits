package: gdb
description: gdb library/tool (from LCG software stack)
version: "17.1"
tag: "17.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gdb-17.1.tar.gz
requires:
  - texinfo
  - Python
  - gmp
  - mpfr
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
  $SOURCEDIR/configure --prefix=$INSTALLROOT  --enable-install-libiberty
}
