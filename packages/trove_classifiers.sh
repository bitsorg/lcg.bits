package: trove_classifiers
description: trove-classifiers canonical list of Python package classifiers
version: "2026.5.7.17"
tag: "2026.5.7.17"
requires:
  - Python
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
