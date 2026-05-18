package: qqvvamp
description: qq→VV amplitude library for EW boson pair production
version: "1.1.atlas1"
tag: "1.1.atlas1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/qqvvamp-1.1.atlas1.tar.gz
requires:
  - ginac
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-QQVVAMP
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
