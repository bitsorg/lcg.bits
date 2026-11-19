package: lmfit
description: lmfit non-linear least-squares minimization for Python
version: "1.2.2"
tag: "1.2.2"
requires:
  - Python
  - asteval
  - uncertainties
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