package: pandoraanalysis
description: PandoraAnalysis validation for Pandora PFA
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pandoraanalysis-HEAD.tar.gz
requires:
  - ilcutil
  - marlin
  - marlinutil
  - ROOT
  - DD4hep
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
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
