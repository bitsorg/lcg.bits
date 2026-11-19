package: numdifftools
description: numdifftools numerical differentiation tools for Python
version: "0.9.41"
tag: "0.9.41"
requires:
  - Python
  - numpy
  - scipy
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