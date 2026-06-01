package: fccdetectors
description: FCC detector geometry descriptions for simulation
version: "main"
tag: "main"
source: https://github.com/HEP-FCC/FCCDetectors.git
requires:
  - CMake
  - DD4hep
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
