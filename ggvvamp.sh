package: ggvvamp
description: gg→VV amplitude library for loop-induced processes
version: "1.0.atlas1"
tag: "1.0.atlas1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/ggvvamp-1.0.atlas1.tar.gz
requires:
  - ginac
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-GGVVAMP
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake \
    -DGiNaC_DIR=${ginac_ROOT}
}
