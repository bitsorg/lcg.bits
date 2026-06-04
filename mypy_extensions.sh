package: mypy_extensions
description: mypy_extensions experimental type system extensions
version: "1.0.0"
tag: "1.0.0"
requires:
  - Python
  - typing_extensions
  - tomli
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