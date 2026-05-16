package: hydjet
description: HYDJET heavy-ion event generator for jet quenching studies
version: "1.8"
tag: "1.8"
build_requires:
  - bits-recipe-tools
license: LicenseRef-HYDJET
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
