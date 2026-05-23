package: linkify_it_py
description: linkify-it-py links recognition library for Python
version: "2.0.2"
tag: "2.0.2"
requires:
  - Python
  - uc_micro_py
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