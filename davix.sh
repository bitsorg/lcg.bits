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
  # Davix's cmake/modules/buildCurl.cmake applies the bundled-curl CVE patches
  # in place under CMAKE_SOURCE_DIR/deps/curl and only resets them first when
  # deps/curl is a git submodule (its reset is guarded by `test -f .git`). bits
  # builds from a release tarball (no .git, and the CMakeRecipe rsync strips
  # **/.git), so the patches get applied to the shared SOURCES tree and stick —
  # the next build re-runs `git apply` on the already-patched files and dies with
  # "patch does not apply" (setopt.c / socks.c). Reverse the patches here first
  # (a no-op the first time, before they are applied) so Davix's own forward
  # git apply always starts from pristine curl sources.
  local _curl="$SOURCEDIR/deps/curl"
  if [ -d "$_curl" ]; then
    for _p in curl-CVE-2023-38545_7.69.0.patch curl-CVE-2022-32221.patch; do
      if [ -f "$SOURCEDIR/$_p" ]; then
        patch -R -p1 -f -s -d "$_curl" < "$SOURCEDIR/$_p" >/dev/null 2>&1 || true
      fi
    done
  fi

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
