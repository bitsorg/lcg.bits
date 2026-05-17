package: protos
description: PROTOS Monte Carlo event generator for e+e- physics
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/Protosunknown.tar.gz
requires:
  - lhapdf
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-PROTOS
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS} FC=<protos_unknown_FC> LIBRARY_PATH=${lhapdf_ROOT}/lib
  make ${JOBS:+-j $JOBS} INSTALL_DIR=$INSTALLROOT/bin install
}
