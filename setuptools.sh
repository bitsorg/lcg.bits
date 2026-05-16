package: setuptools
description: setuptools Python packaging, build and distribution library
version: "80.10.2"
tag: "80.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/setuptools-80.10.2.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS}
  mkdir -p $INSTALLROOT/lib/python3/site-packages
}
