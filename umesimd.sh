package: umesimd
description: "UME::SIMD explicit SIMD vector programming library"
version: "0.8.1"
tag: "0.8.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/umesimd-0.8.1.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--include"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS}
  cmake -E make_directory $INSTALLROOT/include \
  && cmake -E make_directory $INSTALLROOT/include/umesimd \
  && cmake -E copy_directory $SOURCEDIR $INSTALLROOT/include/umesimd/
}
