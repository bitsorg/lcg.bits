package: retry
description: retry decorators for retrying function calls
version: "0.9.2"
tag: "0.9.2"
requires:
  - Python
  - decorator
  - py
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