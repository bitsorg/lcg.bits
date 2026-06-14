package: zstd
description: Zstandard real-time lossless data compression library
version: "1.5.7"
tag: "1.5.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig --cmake"
##############################
function Configure() {
  cmake "${SOURCEDIR}/build/cmake" \
    -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DZSTD_BUILD_SHARED=ON \
    -DZSTD_BUILD_STATIC=ON \
    -DZSTD_BUILD_PROGRAMS=ON \
    -DZSTD_BUILD_TESTS=OFF
}
