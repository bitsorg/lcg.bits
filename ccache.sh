package: ccache
description: Compiler cache that speeds up recompilation
version: "4.13.6"
tag: "4.13.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ccache-4.13.6.tar.gz
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
function Configure() {
  cmake \
    -DENABLE_TESTING=OFF
}
