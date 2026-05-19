package: ensmallen
description: Ensmallen C++ header-only numerical optimization library
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ensmallen-unknown.tar.gz
requires:
  - CMake
  - armadillo
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--inc --cmake"
##############################
