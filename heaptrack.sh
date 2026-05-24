package: heaptrack
description: Heaptrack heap memory profiler
version: "1.5.0"
tag: "1.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/heaptrack-v1.5.0.tar.gz
requires:
  - CMake
  - Boost
  - libunwind
  - zlib
  - gdb
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
patches:
  - heaptrack-1.5.0.patch
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
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DHEAPTRACK_BUILD_INTERPRET=ON
}
