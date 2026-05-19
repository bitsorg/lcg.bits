package: kiwisolver
description: Kiwisolver efficient C++ implementation of Cassowary solver
version: "1.4.5"
tag: "1.4.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kiwisolver-1.4.5.tar.gz
requires:
  - Python
  - cppy
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################