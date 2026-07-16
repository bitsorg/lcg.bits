package: hdf5
description: HDF5 hierarchical data format library for large datasets
version: "1.14.6"
source: https://github.com/HDFGroup/hdf5
tag: "hdf5-%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - zlib
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DHDF5_BUILD_CPP_LIB=ON \
    -DHDF5_BUILD_FORTRAN=OFF \
    -DHDF5_BUILD_EXAMPLES=OFF \
    -DHDF5_BUILD_TESTS=OFF \
    -DHDF5_ENABLE_Z_LIB_SUPPORT=ON \
    ${ZLIB_ROOT:+-DZLIB_ROOT="${ZLIB_ROOT}"} \
    -DHDF5_INSTALL_LIB_DIR=lib
}
function PostInstall() {
  printf 'setenv HDF5_ROOT $PKG_ROOT\n' >> "${INSTALLROOT}/etc/modulefiles/${PKGNAME}"
}
