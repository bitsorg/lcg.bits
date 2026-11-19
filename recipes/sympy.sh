package: sympy
description: SymPy Python library for symbolic mathematics
version: "1.14.0"
tag: "1.14.0"
requires:
  - Python
  - mpmath
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