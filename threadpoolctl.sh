package: threadpoolctl
description: threadpoolctl limit threads in native libs (BLAS, OpenMP)
version: "3.5.0"
tag: "3.5.0"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################