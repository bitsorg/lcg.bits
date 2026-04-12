package: fplll
description: fplll library/tool (from LCG software stack)
version: "5.4.4"
tag: "5.4.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fplll-5.4.4.tar.gz
requires:
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
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT --with-mpfr=${mpfr_ROOT}
}
