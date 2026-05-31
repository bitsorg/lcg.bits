package: soqt
description: SoQt Qt widget for OpenInventor/Coin3D
version: "1.5.0"
tag: "1.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/SoQt-1.5.0.tar.gz
requires:
  - coin3d
  - Qt6
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --enable-debug=no --enable-symbols=no --with-coin=${COIN3D_ROOT} --with-qt=${Qt6_ROOT} QTDIR=${Qt6_ROOT}
}
