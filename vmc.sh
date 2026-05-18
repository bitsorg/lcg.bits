package: vmc
description: VMC (Virtual Monte Carlo) interface library
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/vmc-unknown.tar.gz
requires:
  - CMake
  - ROOT
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
    -DCMAKE_INSTALL_LIBDIR=lib
}
