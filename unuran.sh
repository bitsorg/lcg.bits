package: unuran
description: unuran library/tool (from LCG software stack)
version: "1.11.0"
tag: "1.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/unuran-1.11.0.tar.gz
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
  ./configure --prefix=$INSTALLROOT --without-urng-gsl --enable-shared
}
