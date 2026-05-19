package: xrootd
description: XRootD high-performance, fault-tolerant access to data
version: "6.0.1"
tag: "6.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xrootd-6.0.1.tar.gz
requires:
  - CMake
  - Python
  - setuptools
  - zlib
  - libxml2
  - pip
  - curl
  - Davix
  - libzip
  - readline
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
  PKG_CONFIG_PATH="${LIBZIP_ROOT}/lib/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}" \
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_PREFIX_PATH="${LIBZIP_ROOT}" \
    -DFORCE_ENABLED=ON \
    -DENABLE_FUSE=FALSE \
    -DENABLE_KRB5=TRUE \
    -DENABLE_READLINE=TRUE \
    -DREADLINE_ROOT_DIR="${READLINE_ROOT}" \
    -DREADLINE_INCLUDE_DIR="${READLINE_ROOT}/include" \
    -DENABLE_PYTHON=TRUE \
    -DENABLE_VOMS=FALSE \
    -DENABLE_HTTP=TRUE \
    -DENABLE_XRDCL=ON \
    -DXRDCL_ONLY=ON \
    -DENABLE_XRDEC=OFF
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'MODEOF'
setenv XRD_CONNECTIONWINDOW 3
setenv XRD_CONNECTIONRETRY 1
setenv XRD_TIMEOUTRESOLUTION 1
setenv XRD_REQUESTTIMEOUT 150
MODEOF
}
