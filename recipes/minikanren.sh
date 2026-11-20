package: minikanren
description: miniKanren logic programming micro-framework for Python
version: "1.0.3"
tag: "1.0.3"
requires:
  - Python
  - cons
  - etuples
  - logical_unification
  - multipledispatch
  - toolz
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