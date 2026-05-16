package: pycparser
description: pycparser complete C99 parser in pure Python
version: "2.22"
tag: "2.22"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pycparser-2.22.zip
requires:
  - Python
  - setuptools
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
