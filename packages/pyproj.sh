package: pyproj
description: pyproj Python interface to PROJ cartographic library
version: "3.7.1"
tag: "3.7.1"
requires:
  - Python
  - proj
  - cython
  - certifi
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################