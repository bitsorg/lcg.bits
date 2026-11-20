package: pure_eval
description: pure_eval safely evaluate Python expressions without side-effects
version: "0.2.3"
tag: "0.2.3"
requires:
  - Python
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