package: Davix
description: Davix high-performance data access library for HTTP/WebDAV/S3
version: "0.8.10"
tag: "0.8.10"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/davix-0.8.10.tar.gz
requires:
  - Boost
  - libxml2
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
    -DCMAKE_BUILD_TYPE=Release \
    -DDAVIX_TESTS=OFF
}
