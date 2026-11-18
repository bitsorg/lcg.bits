package: vector
description: vector Lorentz/spatial vector library for HEP in Python
version: "1.8.0"
tag: "1.8.0"
requires:
  - Python
  - hatchling
  - numpy
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