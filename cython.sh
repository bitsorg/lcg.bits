package: cython
description: Cython C-extensions for Python compiler
version: "3.2.4"
tag: "3.2.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cython-3.2.4.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  python3 setup.py -v build -e "/usr/bin/env python" BUILD_COMMAND
  mkdir -p $INSTALLROOT/lib/python3/site-packages
}