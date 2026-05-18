package: ilcutil
description: ILCUtil utility library for ILC software packages
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ilcutil-HEAD.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=${ENABLE_IPO}
}
