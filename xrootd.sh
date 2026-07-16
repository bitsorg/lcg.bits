package: xrootd
description: XRootD high-performance, fault-tolerant access to data
version: "5.9.1"
source: https://github.com/xrootd/xrootd
mem_per_job: 1024
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - Python
  - zlib
  - libxml2
  - curl
  - Davix
  - libzip
  - uuid
# - readline
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pysite"
##############################
function Configure() {
  # libuuid (uuid/uuid.h) — same dependency Davix needs; point FindUUID at the
  # uuid package explicitly. Linux ships libuuid.so; the uuid recipe ships only
  # a static lib on macOS.
  local libuuid_ext=so
  [[ $ARCHITECTURE == osx* ]] && libuuid_ext=a
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=lib \
      ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      ${UUID_ROOT:+-DUUID_LIBRARY="$UUID_ROOT/lib/libuuid.$libuuid_ext"} \
      ${UUID_ROOT:+-DUUID_INCLUDE_DIR="$UUID_ROOT/include"} \
    -DENABLE_READLINE=FALSE \
    -DFORCE_ENABLED=ON \
    -DENABLE_FUSE=FALSE \
    -DENABLE_KRB5=TRUE \
    -DENABLE_PYTHON=TRUE \
    -DENABLE_VOMS=FALSE \
    -DENABLE_HTTP=TRUE \
    -DENABLE_XRDCL=ON \
    -DXRDCL_ONLY=ON \
    -DENABLE_XRDEC=OFF
}
function MakeInstall() {
  # XRootD 6.0.1 cmake_install.cmake calls pip without --no-build-isolation.
  # Build isolation creates a fresh env where setuptools is not available.
  # Patch all generated cmake_install.cmake files in the build tree before install.
  find "$BITS_CMAKE_BUILD" -name 'cmake_install.cmake' \
    -exec sed -i 's/pip install /pip install --no-build-isolation /g' {} +
  cmake --install "$BITS_CMAKE_BUILD"
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'MODEOF'
setenv XRD_CONNECTIONWINDOW 3
setenv XRD_CONNECTIONRETRY 1
setenv XRD_TIMEOUTRESOLUTION 1
setenv XRD_REQUESTTIMEOUT 150
MODEOF
}
