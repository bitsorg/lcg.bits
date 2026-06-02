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
  # libdw/libelf for the interpret tool -- system_requirement, taken from /usr.
  - elfutils
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
  # heaptrack's interpret tool needs elfutils (libdw/libelf >= 0.158), which is
  # taken from the system. Make sure the system pkg-config dirs are searched so
  # FindElfutils locates the system libdw.pc even when bits has set a
  # bits-only PKG_CONFIG_PATH. Also expose the system include/lib roots to
  # CMake's search so find_path/find_library can see /usr.
  export PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig:${PKG_CONFIG_PATH}"
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
    -DCMAKE_SYSTEM_PREFIX_PATH=/usr \
      -DCMAKE_BUILD_TYPE=Release \
    -DHEAPTRACK_BUILD_INTERPRET=ON
}
