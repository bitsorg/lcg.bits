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
# Davix's buildCurl.cmake patches bundled curl in place under deps/curl. The
# framework builds out-of-source from the private rsync'd copy, so Davix patches
# the copy, not SOURCES. Configure only needs the reverse-patch reset + uuid hints.
function Configure() {
  # Reset the bundled-curl patch targets so Davix's forward git apply starts
  # pristine (reverts a prior apply on rebuild, since buildCurl.cmake's own reset
  # needs a .git submodule the tarball lacks).
  if [ -d deps/curl ]; then
    for _p in curl-CVE-2023-38545_7.69.0.patch curl-CVE-2022-32221.patch; do
      [ -f "$_p" ] && patch -R -p1 -f -s -d deps/curl < "$_p" >/dev/null 2>&1 || true
    done
  fi

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
      ${OPENSSL_ROOT:+-DOPENSSL_ROOT_DIR="$OPENSSL_ROOT"} \
      ${BOOST_ROOT:+-DBOOST_ROOT="$BOOST_ROOT"} \
      ${UUID_ROOT:+-DUUID_LIBRARY="$UUID_ROOT/lib/libuuid.$libuuid_ext"} \
      ${UUID_ROOT:+-DUUID_INCLUDE_DIR="$UUID_ROOT/include"} \
    -DDAVIX_TESTS=OFF \
    -DEMBEDDED_RAPIDJSON=ON
}
