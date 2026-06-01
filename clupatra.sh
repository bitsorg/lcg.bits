package: clupatra
description: Clupatra Kalman-filter track finding for ILC/CLICdp
version: "HEAD"
tag: "HEAD"
source: git+https://github.com/iLCSoft/Clupatra.git?obj=master
requires:
  - CMake
  - ilcutil
  - marlin
  - marlinutil
  - GSL
  - DD4hep
  - ROOT
  - marlintrk
  - kaltest
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
