package: kt_legacy
description: kt-legacy k_T jet clustering legacy routines
version: "1.0.5"
tag: "1.0.5"
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