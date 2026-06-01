package: iwyu
description: Include-What-You-Use C/C++ header analysis tool
# IWYU is tied to the Clang/LLVM major version: 0.18 targets Clang 16, but this
# stack ships Clang 20 (the 0.18 build failed with classof-ambiguous LLVM API
# errors). 0.24 is the release for Clang 20.
version: "0.24"
tag: "0.24"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/include-what-you-use-%(version)s.src.tar.gz
requires:
  - CMake
  - Clang
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
