package: autograd
description: Autograd automatic differentiation of NumPy code
version: "1.7.0"
tag: "1.7.0"
requires:
  - Python
  - numpy
  - scipy
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