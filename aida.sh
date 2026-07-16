package: AIDA
description: Abstract Interfaces for Data Analysis (HEP histogram/tree interface)
version: "3.2.1"
source: https://github.com/bitslcg/AIDA.git
tag: "v%(version)s"
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
MODULE_OPTIONS="--inc"
##############################
function Make() {
  mkdir -p $INSTALLROOT/include   
  cp -r $SOURCEDIR/cpp/AIDA $INSTALLROOT/include/
}
