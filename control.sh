package: control
description: Python Control Systems Library
version: "0.9.1"
tag: "0.9.1"
requires:
  - Python
  - numpy
  - scipy
  - matplotlib
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