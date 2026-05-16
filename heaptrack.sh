package: heaptrack
description: Heaptrack heap memory profiler
version: "1.5.0"
tag: "1.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/heaptrack-v1.5.0.tar.gz
requires:
  - Boost
  - libunwind
  - zlib
  - gdb
build_requires:
  - bits-recipe-tools
license: GPL-2.0-or-later
patches:
  - heaptrack-1.5.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_COMPILER=$CXX \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DHEAPTRACK_BUILD_INTERPRET=ON
}
