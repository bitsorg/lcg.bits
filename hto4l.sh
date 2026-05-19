package: hto4l
description: HTo4l NLO generator for H→4 leptons via gg fusion
version: "2.02"
tag: "2.02"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/Hto4l-v2.02.tar.bz2
requires:
  - CMake
  - GSL
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-HTo4l
patches:
  - hto4l-2.02.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS} GSL_HOME=${GSL_ROOT}
  cmake -E make_directory $INSTALLROOT/bin
cmake
}
