package: coin3d
description: Coin3D high-level 3D graphics library (OpenInventor API)
version: "3.1.3p2"
tag: "3.1.3p2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Coin-3.1.3p2.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
patches:
  - coin3d-3.1.3p2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --enable-debug=no --enable-symbols=no
}
