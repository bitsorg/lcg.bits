package: fccdetectors
description: FCC detector geometry descriptions for simulation
version: "0.1pre11"
tag: "v0.1pre11"
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
