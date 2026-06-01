package: garlic
description: GARLIC Geant4-based calorimeter photon veto simulation
version: "master"
tag: "master"
source: https://github.com/iLCSoft/Garlic.git
requires:
  - CMake
  - ilcutil
  - marlin
  - marlinutil
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
