package: torch_scatter
description: torch-scatter segment-based reduction operations
version: "2.1.2"
tag: "2.1.2"
requires:
  - torch
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