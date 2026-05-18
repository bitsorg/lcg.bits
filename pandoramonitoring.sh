package: pandoramonitoring
description: PandoraMonitoring ROOT-based visualization for Pandora
version: "03.06.00"
tag: "03.06.00"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pandoramonitoring-03.06.00.tar.gz
requires:
  - ROOT
  - pandorasdk
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_MODULE_PATH=${pandorapfa_ROOT}/cmakemodules \
    -DCMAKE_CXX_FLAGS="-Wno-error"
}
