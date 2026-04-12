package: pythia6
description: Pythia 6 Monte Carlo event generator (legacy Fortran version)
version: "6.4.28.snd"
tag: "6.4.28.snd"
build_requires:
  - bits-recipe-tools
license: LicenseRef-Pythia6
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
