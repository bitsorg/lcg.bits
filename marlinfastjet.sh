package: marlinfastjet
description: MarlinFastJet FastJet jet finding Marlin processor
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/marlinfastjet-HEAD.tar.gz
requires:
  - ilcutil
  - marlin
  - marlinutil
  - fastjet
  - fjcontrib
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
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
    -DBUILD_TESTING=OFF \
    -DCMAKE_CXX_FLAGS="-I${fjcontrib_ROOT}/include" \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=${ENABLE_IPO}
}
