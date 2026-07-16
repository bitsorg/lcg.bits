package: lz4
description: LZ4 extremely fast lossless compression library
version: "1.10.0"
source: https://github.com/lz4/lz4
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
prefer_system: osx.*
prefer_system_check: |
  printf "#include <lz4.h>\n" | cc -xc -I$(brew --prefix lz4)/include - -c -M 2>&1

requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig --cmake"
##############################
function Configure() {
  # lz4's CMakeLists.txt is in build/cmake/, not the source root
  cmake -S "$BITS_CMAKE_SRC/build/cmake" -B "$BITS_CMAKE_BUILD" \
    -DCMAKE_INSTALL_PREFIX="$INSTALLROOT" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release
}
