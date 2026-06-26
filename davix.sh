package: Davix
description: High-performance HTTP/WebDAV/S3/cloud storage I/O library
version: "0.8.10"
mem_per_job: 1024
tag: "0.8.10"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/davix-0.8.10.tar.gz
requires:
  - CMake
  - Boost
  - OpenSSL
  - libxml2
  - uuid
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  # libuuid provides uuid/uuid.h, needed by Davix's Azure/S3 backend (AzureIO).
  # Davix's FindUUID needs both vars; point them at the uuid package explicitly
  # (mirrors xrootd.sh). On Linux the shared lib is libuuid.so; the uuid recipe
  # ships only a static lib on macOS.
  local libuuid_ext=so
  [[ $ARCHITECTURE == osx* ]] && libuuid_ext=a
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=lib \
      ${OPENSSL_ROOT:+-DOPENSSL_ROOT_DIR="$OPENSSL_ROOT"} \
      ${BOOST_ROOT:+-DBOOST_ROOT="$BOOST_ROOT"} \
      ${UUID_ROOT:+-DUUID_LIBRARY="$UUID_ROOT/lib/libuuid.$libuuid_ext"} \
      ${UUID_ROOT:+-DUUID_INCLUDE_DIR="$UUID_ROOT/include"} \
    -DDAVIX_TESTS=OFF \
    -DEMBEDDED_RAPIDJSON=ON
}
