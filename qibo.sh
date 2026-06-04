package: qibo
description: Qibo open-source quantum computing framework
version: "0.3.3"
tag: "0.3.3"
requires:
  - Python
  - cma
  - joblib
  - networkx
  - numpy
  - openqasm3
  - scipy
  - sympy
  - tabulate
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
