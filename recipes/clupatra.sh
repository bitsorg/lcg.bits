package: clupatra
description: Clupatra Kalman-filter track finding for ILC/CLICdp
version: "01.04"
tag: "v01-04"
source: https://github.com/iLCSoft/Clupatra.git
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
