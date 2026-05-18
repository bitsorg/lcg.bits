package: genfit
description: GenFit generic track fitting framework
version: "2.0.5"
tag: "2.0.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/GenFit-2.0.5.tar.gz
requires:
  - CMake
  - ROOT
  - eigen
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
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
}
