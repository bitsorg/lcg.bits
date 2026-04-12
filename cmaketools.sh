package: cmaketools
description: CMake utility scripts and helper modules for LCG builds
version: "1.9"
tag: "1.9"
sources:
  - https://github.com/HEP-SF/cmaketools/archive/1.9.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Make() {
  make ${JOBS:+-j $JOBS}
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT/share/CMakeTools
}
