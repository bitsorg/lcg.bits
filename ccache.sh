package: ccache
description: Compiler cache that speeds up recompilation
version: "4.13.6"
tag: "4.13.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  # Disable ccache's Redis backend. When no system hiredis is found, ccache's
  # CMake FetchContent-downloads hiredis from GitHub; that live fetch is
  # non-reproducible and, when it fails (HTTP 504 seen here), leaves the
  # ccache_framework target with no sources ("No SOURCES given to target").
  # A compile cache needs no Redis backend. (GCC-Toolchain builds its own ccache
  # with the same flags — this standalone recipe is normally redundant.)
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
      -DREDIS_STORAGE_BACKEND=OFF \
      -DHIREDIS_FROM_INTERNET=OFF \
    -DENABLE_TESTING=OFF
}
