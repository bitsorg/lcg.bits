package: re2
description: RE2 fast, safe regular expression library
version: "2023.11.01"
tag: "2023.11.01"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/re2-2023.11.01.tar.gz
requires:
  - absl
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
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
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_SHARED_LIBS=ON \
    -DRE2_USE_ICU=OFF
}
