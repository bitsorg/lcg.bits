package: soqt
description: soqt library/tool (from LCG software stack)
version: "1.5.0"
tag: "1.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/SoQt-1.5.0.tar.gz
requires:
  - coin3d
  - Qt
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
  ./configure --prefix=$INSTALLROOT --enable-debug=no --enable-symbols=no --with-coin=${coin3d_ROOT} --with-qt=${Qt_ROOT} QTDIR=${Qt_ROOT}
}
