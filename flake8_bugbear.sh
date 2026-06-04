package: flake8_bugbear
description: flake8-bugbear extra opinionated warnings for Flake8
version: "25.10.21"
tag: "25.10.21"
requires:
  - Python
  - flake8
  - attrs
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