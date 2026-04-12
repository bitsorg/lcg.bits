package: bdsim
description: bdsim Monte Carlo event generator
version: "1.7.7"
tag: "1.7.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/bdsim-1.7.7).tar.gz
requires:
  - Geant4
  - ROOT
  - clhep
  - flex
  - bison
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
