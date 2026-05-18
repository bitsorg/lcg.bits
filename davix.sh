package: Davix
description: High-performance HTTP/WebDAV/S3/cloud storage I/O library
version: "0.8.10"
tag: "0.8.10"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/davix-0.8.10.tar.gz
requires:
  - Boost
  - libxml2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake \
    -DDAVIX_TESTS=OFF
}
