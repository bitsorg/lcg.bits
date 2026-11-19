package: wcwidth
description: wcwidth Python port of wcwidth(3) for wide character support
version: "0.2.5"
tag: "0.2.5"
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