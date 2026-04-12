package: numpy
description: numpy library/tool (from LCG software stack)
version: "2.4.0"
tag: "2.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/numpy-2.4.0.tar.gz
requires:
  - Python
  - setuptools
  - blas
  - cython
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
  cmake
  make ${JOBS:+-j $JOBS}
  mkdir -p $INSTALLROOT/lib/python3/site-packages
}
