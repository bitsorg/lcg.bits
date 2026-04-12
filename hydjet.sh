package: hydjet
description: hydjet Monte Carlo event generator
version: "1.8"
tag: "1.8"
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
