package: pyquen
description: PYQUEN parton quenching model for heavy-ion collisions
version: "1.5.1"
tag: "1.5.1"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-PYQUEN
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
