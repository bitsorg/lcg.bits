package: lcgenv
description: LCGenv environment setup script generator
version: "1.3.22"
tag: "v1.3.22"
source: https://gitlab.cern.ch/GENSER/lcgenv.git
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Make() {
  make ${JOBS:+-j $JOBS}
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT
}
