package: autopep8
description: autopep8 automatic PEP 8 Python code formatter
version: "2.3.1"
tag: "2.3.1"
requires:
  - Python
  - pycodestyle
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