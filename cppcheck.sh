package: cppcheck
description: Static analysis tool for C/C++ code
version: "2.20.0"
source: https://github.com/danmar/cppcheck
tag: "%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - Python
  - pcre2
  - pygments
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-only
patches:
  - cppcheck-2.20.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################