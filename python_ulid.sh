package: python_ulid
description: python-ulid ULID (Universally Unique Lexicographically Sortable) IDs
version: "3.1.0"
tag: "3.1.0"
requires:
  - Python
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