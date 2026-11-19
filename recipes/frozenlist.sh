package: frozenlist
description: frozenlist list-like structure that can be frozen
version: "1.4.1"
tag: "1.4.1"
requires:
  - Python
  - cython
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