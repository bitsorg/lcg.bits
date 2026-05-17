package: omniorb
description: omniORB portable CORBA ORB for C++
version: "4.3.2"
tag: "4.3.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/omniORB-4.3.2.tar.bz2
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later AND LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT PYTHON=/usr/bin/env\ python
}
