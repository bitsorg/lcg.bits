package: xrootd
description: XRootD high-performance, fault-tolerant access to data
version: "6.0.1"
tag: "6.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xrootd-6.0.1.tar.gz
requires:
  - CMake
  - Python
  - zlib
  - libxml2
  - pip
  - curl
  - Davix
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
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DFORCE_ENABLED=ON \
    -DENABLE_FUSE=FALSE \
    -DENABLE_KRB5=TRUE \
    -DENABLE_READLINE=TRUE \
    -DREADLINE_ROOT_DIR="${readline_ROOT}" \
    -DREADLINE_INCLUDE_DIR="${readline_ROOT}/include" \
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
