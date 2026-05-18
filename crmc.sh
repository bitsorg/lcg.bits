package: crmc
description: CRMC cosmic ray Monte Carlo interface package
version: "2.0.1p5"
tag: "2.0.1p5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/crmc.v2.0.1p5.tar.gz
requires:
  - Boost
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-CRMC
patches:
  - crmc-2.0.1p5.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake \
    -DBOOST_ROOT=${Boost_ROOT} \
    -DBOOST_INCLUDE_DIR=${Boost_home_include} \
    -DBoost_NO_SYSTEM_PATHS=TRUE
}
