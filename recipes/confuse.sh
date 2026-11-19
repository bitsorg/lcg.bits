package: confuse
description: Confuse configuration library for Python apps
version: "2.0.1"
tag: "2.0.1"
requires:
  - Python
  - PyYAML
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