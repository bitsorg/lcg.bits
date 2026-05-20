package: mysql
description: MySQL relational database server and client libraries
version: "10.11.16"
tag: "10.11.16"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mariadb-10.11.16.tar.gz
requires:
  - CMake
  - Boost
  - bison
  - jemalloc
  - libevent
  - zlib
  - libxml2
  - lz4
  - zeromq
  - msgpackc
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
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
    -DENABLE_DTRACE=0 \
    -DDOWNLOAD_BOOST=1 \
    -DWITH_BOOST="$SOURCEDIR/boost" \
    -DWITH_PCRE=bundled \
    -DMYSQL_MAINTAINER_MODE=OFF
}
