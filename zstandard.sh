package: zstandard
description: zstandard Python bindings for Zstandard compression
version: "0.23.0"
tag: "0.23.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/zstandard-0.23.0.tar.gz
requires:
  - Python
  - setuptools
  - cffi
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS}
  mkdir -p $INSTALLROOT/lib/python3/site-packages
}
