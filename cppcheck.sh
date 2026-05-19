package: cppcheck
description: Static analysis tool for C/C++ code
version: "2.20.0"
tag: "2.20.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cppcheck-2.20.0.tar.gz
requires:
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################