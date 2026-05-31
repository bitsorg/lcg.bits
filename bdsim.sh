package: bdsim
description: Beam Delivery Simulation toolkit based on Geant4
version: "1.7.8-rc1"
tag: "1.7.8-rc1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - Geant4
  - ROOT
  - clhep
  - yacc-like
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
patches:
  - bdsim-1.7.8-rc1.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
