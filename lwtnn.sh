package: lwtnn
description: lwtnn lightweight neural-network inference library (C++)
version: "2.13"
tag: "2.13"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lwtnn-2.13.tar.gz
requires:
  - eigen
  - Boost
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
    -DBOOST_INCLUDEDIR=${Boost_ROOT}/include \
    -DBOOST_ROOT=${Boost_ROOT}
}
