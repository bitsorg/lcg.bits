package: xarray
description: xarray labeled multi-dimensional arrays for Python
version: "2025.4.0"
tag: "2025.4.0"
requires:
  - Python
  - numpy
  - packaging
  - pandas
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