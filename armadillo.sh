package: armadillo
description: Armadillo C++ linear algebra library with MATLAB-like API
version: "11.4.2"
tag: "11.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.xz
requires:
  - CMake
  - blas
  - hdf5
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
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DOPENBLAS_PROVIDES_LAPACK=true \
    -DALLOW_BLAS_LAPACK_MACOS=true
}
