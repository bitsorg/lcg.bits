package: numba
description: numba library/tool (from LCG software stack)
version: "0.63.0rc1"
tag: "0.63.0rc1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/numba-0.63.0rc1.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - llvmlite
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
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS}
  mkdir -p $INSTALLROOT/lib/python3/site-packages
}
