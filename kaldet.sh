package: kaldet
description: KalDet Kalman-filter detector model for ILC
version: "HEAD"
tag: "HEAD"
source: git+https://github.com/iLCSoft/KalDet.git?obj=master
requires:
  - CMake
  - ilcutil
  - marlin
  - kaltest
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
