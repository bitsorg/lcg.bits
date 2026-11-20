package: fcc_config
description: FCC (Future Circular Collider) detector configuration files
version: "0.3.0"
tag: "v0.3.0"
source: https://github.com/HEP-FCC/FCC-config.git
requires:
  - CMake
  - DD4hep
  - k4geo
  - ROOT
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
