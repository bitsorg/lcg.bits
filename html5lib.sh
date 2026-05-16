package: html5lib
description: html5lib Python HTML5 parser
version: "1.1"
tag: "1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/html5lib-1.1.tar.gz
requires:
  - Python
  - setuptools
  - webencodings
  - six
build_requires:
  - bits-recipe-tools
license: MIT
patches:
  - html5lib-1.1.patch
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
