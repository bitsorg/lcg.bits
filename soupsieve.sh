package: soupsieve
description: soupsieve CSS selector library for Beautiful Soup 4
version: "2.9.0"
tag: "2.9.0"
requires:
  - Python
# - build
  - virtualenv
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
