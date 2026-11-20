package: cma
description: CMA-ES covariance matrix adaptation evolution strategy optimizer
version: "3.4.0"
tag: "3.4.0"
requires:
  - Python
  - numpy
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