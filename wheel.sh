package: wheel
description: wheel Python built-package format (PEP 427)
version: "0.45.1"
tag: "0.45.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/wheel-0.45.1.tar.gz
requires:
  - Python
  - setuptools
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
