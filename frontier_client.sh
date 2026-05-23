package: Frontier_Client
description: Frontier conditions/calibration data access client
version: "2.10.2"
tag: "2.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/frontier_client__2.10.2__src.tar.gz
requires:
  - expat
  - pacparser
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - Frontier_Client-2.10.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS} dist \
    PACPARSER_DIR="${PACPARSER_ROOT}" \
    EXPAT_DIR="${EXPAT_ROOT}"
}

function MakeInstall() {
  # 'make dist' populates a dist/ subdirectory with the install tree
  cp -a dist/. "$INSTALLROOT/"
}
