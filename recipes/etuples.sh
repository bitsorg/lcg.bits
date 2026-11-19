package: etuples
description: etuples e-tuple algebraic matching for Python
version: "0.3.9"
tag: "0.3.9"
requires:
  - Python
  - cons
  - multipledispatch
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