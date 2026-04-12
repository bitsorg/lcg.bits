package: pycparser
description: pycparser library/tool (from LCG software stack)
version: "2.22"
tag: "2.22"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pycparser-2.22.zip
requires:
  - Python
  - setuptools
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
