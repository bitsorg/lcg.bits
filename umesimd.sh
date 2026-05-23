package: umesimd
description: "UME::SIMD explicit SIMD vector programming library"
version: "0.8.1"
tag: "0.8.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tgz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--inc"
##############################
function Make() {
  make ${JOBS:+-j $JOBS}
  cmake -E make_directory $INSTALLROOT/include \
  && cmake -E make_directory $INSTALLROOT/include/umesimd \
  && cmake -E copy_directory $SOURCEDIR $INSTALLROOT/include/umesimd/
}
