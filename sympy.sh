package: sympy
description: SymPy Python library for symbolic mathematics
version: "1.14.0"
tag: "1.14.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sympy-1.14.0.tar.gz
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################