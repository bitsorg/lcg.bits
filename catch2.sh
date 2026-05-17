package: Catch2
description: Modern C++ unit-testing framework
version: "3.7.1"
tag: "3.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Catch2-3.7.1.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSL-1.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--include"
##############################
