package: mccabe
description: mccabe McCabe complexity checker for Python
version: "0.7.0"
tag: "0.7.0"
requires:
  - Python
  - pytest_runner
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