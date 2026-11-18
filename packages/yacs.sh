package: yacs
description: YACS Yet Another Configuration System for Python
version: "0.1.8"
tag: "0.1.8"
requires:
  - Python
  - PyYAML
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################