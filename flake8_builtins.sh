package: flake8_builtins
description: flake8-builtins check for use of Python builtins as names
version: "3.1.0"
tag: "3.1.0"
requires:
  - Python
  - flake8
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