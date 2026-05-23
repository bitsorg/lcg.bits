package: fonttools
description: fonttools library for manipulating font files in Python
version: "4.40.0"
tag: "4.40.0"
requires:
  - Python
  - fs
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