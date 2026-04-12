package: armadillo
description: Armadillo C++ linear algebra library
version: "11.4.2"
tag: "11.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/armadillo-11.4.2.tar.xz
requires:
  - blas
  - hdf5
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_CXX_STANDARD=17 \
    -DOPENBLAS_PROVIDES_LAPACK=true \
    -DALLOW_BLAS_LAPACK_MACOS=true
}
