package: typing_inspect
description: typing_inspect runtime inspection of Python typing types
version: "0.9.0"
tag: "0.9.0"
requires:
  - Python
  - mypy_extensions
  - typing_extensions
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