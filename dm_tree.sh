package: dm_tree
description: dm-tree library for working with nested data structures
version: "0.1.9"
tag: "0.1.9"
requires:
  - Python
  - six
  - absl_py
  - attrs
  - numpy
  - wrapt
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