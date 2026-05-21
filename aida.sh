package: AIDA
description: Abstract Interfaces for Data Analysis (HEP histogram/tree interface)
version: "3.2.1"
tag: "3.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/aida-3.2.1-src.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--include"
##############################
function Make() {
  mkdir -p $INSTALLROOT/include   
  cp -r $SOURCEDIR/cpp/AIDA $INSTALLROOT/include/
}
