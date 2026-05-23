package: llvmlite
description: llvmlite lightweight LLVM Python bindings for numba
version: "0.46.0rc1"
tag: "0.46.0rc1"
requires:
  - Python
  - wheel
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