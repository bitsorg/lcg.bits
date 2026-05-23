package: narwhals
description: narwhals lightweight dataframe compatibility layer
version: "1.9.4"
tag: "1.9.4"
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