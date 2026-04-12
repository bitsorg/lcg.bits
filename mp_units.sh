package: mp_units
description: mp_units library/tool (from LCG software stack)
version: "bfcb26e5"
tag: "bfcb26e5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mp_units-bfcb26e5.tar.gz
requires:
  - cppgsl
  - fmt
  - Catch2
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
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DMP_UNITS_API_CONTRACTS=MS-GSL
}
