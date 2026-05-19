package: numba
description: Numba JIT compiler for numerical Python (LLVM-based)
version: "0.63.0rc1"
tag: "0.63.0rc1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/numba-0.63.0rc1.tar.gz
requires:
  - Python
  - numpy
  - llvmlite
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
