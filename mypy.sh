package: mypy
description: mypy optional static type checker for Python
version: "1.19.1"
tag: "1.19.1"
requires:
  - Python
  - typing_extensions
  - mypy_extensions
  - tomli
  - pathspec
  - librt
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