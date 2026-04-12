package: doxygen
description: doxygen library/tool (from LCG software stack)
version: "1.16.1"
tag: "1.16.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/doxygen-1.16.1.src.tar.gz
requires:
  - Python
  - graphviz
  - xapian
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
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_OSX_DEPLOYMENT_TARGET=""
}
