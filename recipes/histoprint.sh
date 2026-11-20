package: histoprint
description: histoprint pretty histogram printing in the terminal
version: "2.6.0"
tag: "2.6.0"
requires:
  - Python
  - uhi
  - numpy
  - click
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