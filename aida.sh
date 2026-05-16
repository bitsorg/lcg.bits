package: AIDA
description: Abstract Interfaces for Data Analysis (HEP histogram/tree interface)
version: "3.2.1"
tag: "3.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/aida-3.2.1-src.tar.gz
build_requires:
  - bits-recipe-tools
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS}
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT
}
