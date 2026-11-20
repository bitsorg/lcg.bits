package: traittypes
description: traittypes Numpy array trait types for traitlets
version: "0.2.1"
tag: "0.2.1"
requires:
  - Python
  - traitlets
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