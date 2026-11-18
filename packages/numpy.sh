package: numpy
description: NumPy fundamental package for array computing in Python
version: "2.5.3"
tag: "2.5.3"
requires:
  - Python
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
