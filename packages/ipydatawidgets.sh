package: ipydatawidgets
description: ipydatawidgets Jupyter widgets for n-dimensional arrays
version: "4.3.5"
tag: "4.3.5"
requires:
  - Python
  - traittypes
  - ipywidgets
  - numpy
  - six
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