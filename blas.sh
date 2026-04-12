package: blas
description: Basic Linear Algebra Subprograms reference implementation
version: "0.3.32"
tag: "0.3.32"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/OpenBLAS-0.3.32.tar.gz
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -D \
    -D \
    -D
}
function Make() {
  make ${JOBS:+-j $JOBS} ${blas_options} BIGNUMA=1 NO_AFFINITY=1 TARGET=<blas_0.3.32_target> COMMAND make ${JOBS:+-j $JOBS} test
}
