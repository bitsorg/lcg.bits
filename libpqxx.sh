package: libpqxx
description: libpqxx official C++ client API for PostgreSQL
version: "7.10.1"
tag: "7.10.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.zip
requires:
  - CMake
  - postgresql
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DSKIP_BUILD_TEST=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_DOC=OFF \
    -DPostgreSQL_ROOT="${POSTGRESQL_ROOT}" \
    -DCMAKE_CXX_STANDARD=17
}
