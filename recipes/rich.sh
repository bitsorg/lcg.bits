package: rich
description: Rich Python library for rich text and beautiful formatting
version: "13.9.4"
tag: "13.9.4"
requires:
  - Python
  - commonmark
  - pygments
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################