package: seaborn
description: seaborn statistical data visualization based on matplotlib
version: "0.13.2"
tag: "0.13.2"
requires:
  - Python
  - numpy
  - scipy
  - pandas
  - matplotlib
  - statsmodels
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