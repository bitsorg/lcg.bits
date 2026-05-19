package: suitesparse
description: SuiteSparse sparse matrix algorithms collection
version: "5.10.1"
tag: "5.10.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/suitesparse-5.10.1.tar.gz
requires:
  - CMake
  - blas
  - mpfr
  - gmp
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
patches:
  - suitesparse-5.10.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS}
  make ${JOBS:+-j $JOBS} install CC=$CC INSTALL_LIB=$INSTALLROOT/lib INSTALL_INCLUDE=$INSTALLROOT/include BLAS=-lopenblas LAPACK=-lopenblas
}
function MakeInstall() { true; }
