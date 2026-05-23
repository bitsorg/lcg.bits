package: iwyu
description: Include-What-You-Use C/C++ header analysis tool
version: "0.18"
tag: "0.18"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/include-what-you-use-%(version)s.src.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LLVM-exception
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
