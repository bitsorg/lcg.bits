package: numba
description: Numba JIT compiler for numerical Python (LLVM-based)
version: "0.63.0rc1"
tag: "0.63.0rc1"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
