package: dm_tree
description: dm-tree library for working with nested data structures
version: "0.1.10"
tag: "0.1.10"
requires:
  - Python

  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
PYPI_NAME="dm-tree"
##############################
MODULE_OPTIONS="--bin --python"
##############################
