package: pyrsistent
description: pyrsistent immutable/persistent data structures for Python
version: "0.18.0"
tag: "0.18.0"
requires:
  - Python
  - six
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