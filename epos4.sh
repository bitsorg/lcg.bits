package: epos4
description: EPOS4 hadronic interaction and heavy-ion event generator
version: "4.0.3.atlas1"
tag: "4.0.3.atlas1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/epos4.0.3.atlas1.tgz
requires:
  - ROOT
  - fastjet
  - hepmc3
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-EPOS4
patches:
  - epos4-4.0.3.atlas1.patch
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
    -DCOMPILE_OPTION=BASIC \
    -DCOMPILE_LIBRARY=ON \
    -DFASTSYS=${fastjet_ROOT} \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
}
