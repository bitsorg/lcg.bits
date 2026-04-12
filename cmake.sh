package: CMake
description: Cross-platform build system generator
version: "3.30.6"
tag: "3.30.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cmake-3.30.6.tar.gz
requires:
  - openssl
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
