package: pyquen
description: pyquen Monte Carlo event generator
version: "1.5.1"
tag: "1.5.1"
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
