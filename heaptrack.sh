package: heaptrack
description: Heaptrack heap memory profiler
version: "1.5.0"
tag: "1.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/heaptrack-v1.5.0.tar.gz
requires:
  - CMake
  - Boost
  # libunwind is Linux-oriented (GNU stack unwinding) and is disabled on
  # macOS; gate the requirement so it drops from the osx graph.
  - "libunwind:(?!osx)"
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
  # The interpret tool needs system elfutils (libdw/libelf); add system pkg-config
  # dirs so FindElfutils sees libdw.pc, and CMAKE_SYSTEM_PREFIX_PATH=/usr below
  # so find_path/find_library reach /usr despite the bits-only PKG_CONFIG_PATH.
  export PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig:${PKG_CONFIG_PATH}"
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    -DCMAKE_SYSTEM_PREFIX_PATH=/usr \
      -DCMAKE_BUILD_TYPE=Release \
    -DHEAPTRACK_BUILD_INTERPRET=ON
}
