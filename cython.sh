package: cython
description: cython library/tool (from LCG software stack)
version: "3.2.4"
tag: "3.2.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cython-3.2.4.tar.gz
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
MODULE_OPTIONS="--bin --python"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  <VOID> #BUILD_COMMAND python3 setup.py -v build -e "/usr/bin/env python"
  python3 setup.py -v build -e "/usr/bin/env python" BUILD_COMMAND <VOID>
  mkdir -p $INSTALLROOT/lib/python3/site-packages
}