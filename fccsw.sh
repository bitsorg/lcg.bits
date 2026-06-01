package: fccsw
description: FCCSW Future Circular Collider Software framework
version: "HEAD"
tag: "HEAD"
source: git+https://github.com/HEP-FCC/FCCSW.git?obj=main
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
