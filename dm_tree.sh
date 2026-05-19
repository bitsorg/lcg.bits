package: dm_tree
description: dm-tree library for working with nested data structures
version: "0.1.9"
tag: "0.1.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dm_tree-0.1.9.tar.gz
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################