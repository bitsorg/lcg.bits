package: torch_sparse
description: torch-sparse sparse matrix operations for PyTorch
version: "0.6.18"
tag: "0.6.18"
requires:
  - torch
  - scipy
  - sympy
  # optional:
  # - cuda
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################