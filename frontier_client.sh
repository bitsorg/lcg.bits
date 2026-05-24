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
  # Frontier_Client's Makefile has no parallel-safe dependency between the
  # http sub-make (which creates http/.libs) and the top-level libfrontier_client.so
  # target that needs it.  Force serial build to avoid the race.
  make dist \
    PACPARSER_DIR="${PACPARSER_ROOT}" \
    EXPAT_DIR="${EXPAT_ROOT}"
}

function MakeInstall() {
  # 'make dist' populates a dist/ subdirectory with the install tree
  cp -a dist/. "$INSTALLROOT/"
}
