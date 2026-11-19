package: virtualenv_clone
description: virtualenv-clone create a copy of a virtualenv
version: "0.5.4"
tag: "0.5.4"
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