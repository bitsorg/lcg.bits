package: pyparsing
description: pyparsing Python parsing module
version: "3.2.5"
tag: "3.2.5"
requires:
  - Python
  - railroad_diagrams
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