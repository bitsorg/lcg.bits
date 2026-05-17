package: kokkos
description: Kokkos performance portability programming model
version: "4.7.01"
tag: "4.7.01"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kokkos-4.7.01.tar.gz
requires:
  - hwloc
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_CXX_COMPILER="" \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT
}
