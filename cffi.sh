package: cffi
description: cffi library/tool (from LCG software stack)
version: "2.0.0"
tag: "2.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cffi-2.0.0.tar.gz
requires:
  - Python
  - setuptools
  - pycparser
  - libffi
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
