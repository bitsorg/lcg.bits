package: fonttools
description: fonttools library for manipulating font files in Python
version: "4.60.2"
tag: "4.60.2"
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