package: libosxunwind
description: macOS libunwind stack-unwinding library
version: "0.0.6"
source: https://github.com/JuliaLang/libosxunwind
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT AND Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS}
  cmake -E copy_directory $SOURCEDIR/include/ $INSTALLROOT/include \
  && cmake -E make_directory $INSTALLROOT/lib
cmake
}
