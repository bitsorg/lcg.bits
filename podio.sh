package: podio
description: Plain Old Data I/O library for HEP event data models
version: "01.07"
tag: "01.07"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/podio-01.07.tar.gz
requires:
  - ROOT
  - Python
  - PyYAML
  - tabulate
  - graphviz
  - fmt
  # optional:
  # - SIO
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_CXX_COMPILER=$CXX \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF
}
