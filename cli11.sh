package: cli11
description: CLI11 header-only C++11 command-line parser library
version: "2.4.2"
tag: "2.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/CLI11-2.4.2.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--include"
##############################
