package: recola_SM
description: RECOLA Standard Model process library
version: "2.2.3"
tag: "2.2.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/recola_SM_2.2.3.tar.gz
requires:
  - collier
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake \
    -Dcollier_path=${collier_ROOT}/lib \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -Dstatic=OFF \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
}
