package: mold
description: mold modern high-speed linker for ELF
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mold-unknown.tar.gz
requires:
  - mimalloc
  - tbb
  - zlib
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
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=${ENABLE_IPO} \
    -DMOLD_USE_SYSTEM_MIMALLOC=ON \
    -DMOLD_USE_SYSTEM_TBB=ON
}
