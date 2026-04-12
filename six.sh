package: six
description: six library/tool (from LCG software stack)
version: "1.17.0"
tag: "1.17.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/six-1.17.0.tar.gz
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
