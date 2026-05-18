package: xrootd
description: XRootD high-performance, fault-tolerant access to data
version: "6.0.1"
tag: "6.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xrootd-6.0.1.tar.gz
requires:
  - Python
  - zlib
  - libxml2
  - pip
  - curl
  - Davix
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake \
    -DFORCE_ENABLED=ON \
    -DENABLE_FUSE=FALSE \
    -DENABLE_KRB5=TRUE \
    -DENABLE_READLINE=TRUE \
    -DENABLE_PYTHON=TRUE \
    -DENABLE_VOMS=FALSE \
    -DENABLE_HTTP=TRUE \
    -DENABLE_XRDCL=ON \
    -DXRDCL_ONLY=ON \
    -DENABLE_XRDEC=OFF
}
