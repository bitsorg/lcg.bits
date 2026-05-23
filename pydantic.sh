package: pydantic
description: Pydantic data validation using Python type annotations
version: "2.12.5"
tag: "2.12.5"
requires:
  - Python
  - cython
  - typing_extensions
  - mypy
  - hypothesis
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