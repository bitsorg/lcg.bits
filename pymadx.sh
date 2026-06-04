package: pymadx
description: pyMADX Python wrapper for MAD-X
version: "2.2.1"
tag: "2.2.1"
requires:
  - Python
  - numpy
  - matplotlib
  - importlib_metadata
  - tabulate
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