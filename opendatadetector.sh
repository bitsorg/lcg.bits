package: opendatadetector
description: Open Data Detector ACTS tracking geometry for benchmarks
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/opendatadetector-HEAD.tar.gz
requires:
  - DD4hep
  - ROOT
  - Boost
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
