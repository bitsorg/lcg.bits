package: superchic
description: SuperChic Monte Carlo generator for central exclusive processes
version: "4.02.2"
tag: "4.02.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/superchic-v4.02.2.tar.gz
requires:
  - lhapdf
build_requires:
  - bits-recipe-tools
license: LicenseRef-SuperChic
patches:
  - superchic-4.02.2.patch
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
    -DLHAPDF_DIR=${lhapdf_ROOT} \
    -DSUPERCHIC_ENABLE_TESTS=OFF
}
