package: fccsw
description: FCCSW Future Circular Collider Software framework
version: "1.0pre12"
tag: "v1.0pre12"
source: https://github.com/HEP-FCC/FCCSW.git
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
