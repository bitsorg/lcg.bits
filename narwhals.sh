package: narwhals
description: narwhals lightweight dataframe compatibility layer
version: "2.20.0"
tag: "2.20.0"
requires:
  - Python
  - executing
  - pure_eval
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