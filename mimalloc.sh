package: mimalloc
description: mimalloc compact high-performance memory allocator (Microsoft)
version: "3.2.6"
tag: "3.2.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mimalloc-3.2.6.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=${ENABLE_IPO}
}
