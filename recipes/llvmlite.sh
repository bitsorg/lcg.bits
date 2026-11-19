package: llvmlite
description: llvmlite lightweight LLVM Python bindings for numba
version: "0.47.0"
tag: "0.47.0"
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