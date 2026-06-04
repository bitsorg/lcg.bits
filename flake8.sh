package: flake8
description: Flake8 Python code style, lint and complexity checker
version: "7.3.0"
tag: "7.3.0"
requires:
  - Python
  - entrypoints
  - pyflakes
  - pycodestyle
  - mccabe
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