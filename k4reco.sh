package: k4reco
description: Key4hep reconstruction framework
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/k4reco-HEAD.tar.gz
requires:
  - k4fwcore
  - DD4hep
  - k4simgeant4
  - k4geo
  - LCIO
  - ilcutil
  - kaltest
  - ddkaltest
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
function Configure() {
  cmake \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=${ENABLE_IPO}
}
