package: lap
description: lap fast linear assignment problem solver (C++)
version: "0.5.12"
tag: "0.5.12"
requires:
  - cython
  - numpy
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