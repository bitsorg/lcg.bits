package: statsmodels
description: statsmodels statistical models and tests for Python
version: "0.14.5"
tag: "0.14.5"
requires:
  - Python
  - numpy
  - scipy
  - pandas
  - patsy
  - cython
  - matplotlib
  - nose
  - ipython
  - packaging
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