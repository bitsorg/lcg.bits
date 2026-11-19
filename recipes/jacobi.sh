package: jacobi
description: jacobi Python Jacobi method numerical differentiation
version: "0.9.2"
tag: "0.9.2"
requires:
  - Python
  - numpy
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