package: kokkos
description: kokkos library/tool (from LCG software stack)
version: "4.7.01"
tag: "4.7.01"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kokkos-4.7.01.tar.gz
requires:
  - hwloc
build_requires:
  - bits-recipe-tools
license: TODO
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
