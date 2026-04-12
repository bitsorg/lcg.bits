package: xrootd
description: XRootD high-performance scalable data access framework
version: "5.9.2"
tag: "5.9.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xrootd-5.9.2.tar.gz
requires:
  - Python
  - zlib
  - libxml2
  - pip
  - curl
  - Davix
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
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
