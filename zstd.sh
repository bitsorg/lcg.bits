package: zstd
description: Zstandard real-time lossless data compression library
version: "1.5.7"
source: https://github.com/facebook/zstd
tag: "v%(version)s"
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
  cmake -S "$BITS_CMAKE_SRC/build/cmake" -B "$BITS_CMAKE_BUILD" \
    -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DZSTD_BUILD_SHARED=ON \
    -DZSTD_BUILD_STATIC=ON \
    -DZSTD_BUILD_PROGRAMS=ON \
    -DZSTD_BUILD_TESTS=OFF
}
