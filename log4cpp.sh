package: log4cpp
description: Log4cpp flexible C++ logging library (port of Log4j)
version: "1.1.4"
tag: "1.1.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/log4cpp-1.1.4.tar.gz
build_requires:
  - bits-recipe-tools
license: LGPL-2.1-or-later
patches:
  - log4cpp-1.1.4.patch
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
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_SHARED_LIBS=ON
}
