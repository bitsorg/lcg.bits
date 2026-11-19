package: Davix
description: High-performance HTTP/WebDAV/S3/cloud storage I/O library
version: "0.8.10"
source: https://github.com/cern-fts/davix
mem_per_job: 1024
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/davix-%(version)s.tar.gz
requires:
  - CMake
  - Boost
  - OpenSSL
  - libxml2
  - uuid
  - curl
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
# Davix defaults to building an embedded libcurl (deps/curl), which is fragile
# and breaks with newer toolchains ("No rule to make target …/libcurl.a"). bits
# provides curl, so use it: EMBEDDED_LIBCURL=OFF makes Davix find_package(CURL).
function Configure() {
  # libuuid provides uuid/uuid.h for Davix's Azure/S3 backend; FindUUID needs both
  # vars, so point them at the uuid package explicitly. Linux ships libuuid.so; the
  # uuid recipe ships only a static lib on macOS.
  local libuuid_ext=so
  [[ $ARCHITECTURE == osx* ]] && libuuid_ext=a
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DEMBEDDED_LIBCURL=OFF \
      ${OPENSSL_ROOT:+-DOPENSSL_ROOT_DIR="$OPENSSL_ROOT"} \
      ${BOOST_ROOT:+-DBOOST_ROOT="$BOOST_ROOT"} \
      ${UUID_ROOT:+-DUUID_LIBRARY="$UUID_ROOT/lib/libuuid.$libuuid_ext"} \
      ${UUID_ROOT:+-DUUID_INCLUDE_DIR="$UUID_ROOT/include"} \
    -DDAVIX_TESTS=OFF \
    -DEMBEDDED_RAPIDJSON=ON
}
