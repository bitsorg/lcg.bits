package: Davix
description: High-performance HTTP/WebDAV/S3/cloud storage I/O library
version: "0.8.10"
source: https://github.com/cern-fts/davix
mem_per_job: 1024
tag: "v%(version)s"
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
# Davix's cmake/modules/buildCurl.cmake applies the bundled-curl CVE patches in
# place under CMAKE_SOURCE_DIR/deps/curl. The framework now builds every CMake
# recipe out-of-source from the private rsync'd copy (BITS_CMAKE_SRC=".",
# CMAKE_SOURCE_DIR = the copy), so Davix patches the copy, never the shared
# SOURCES tree — exactly the case this migration exists for. Configure only needs
# the reverse-patch reset + uuid hints; Make/MakeInstall use the framework
# defaults (binary dir BITS_CMAKE_BUILD="build").
function Configure() {
  # Reset the bundled-curl patch targets in the copy so Davix's forward git apply
  # starts pristine (no-op the first time; reverts a prior apply on an
  # incremental rebuild, since buildCurl.cmake's own reset needs a .git submodule
  # which the tarball lacks).
  if [ -d deps/curl ]; then
    for _p in curl-CVE-2023-38545_7.69.0.patch curl-CVE-2022-32221.patch; do
      [ -f "$_p" ] && patch -R -p1 -f -s -d deps/curl < "$_p" >/dev/null 2>&1 || true
    done
  fi

  # libuuid provides uuid/uuid.h, needed by Davix's Azure/S3 backend (AzureIO).
  # Davix's FindUUID needs both vars; point them at the uuid package explicitly
  # (mirrors xrootd.sh). On Linux the shared lib is libuuid.so; the uuid recipe
  # ships only a static lib on macOS.
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
