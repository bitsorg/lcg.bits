package: logical_unification
description: logical-unification unification of Python objects
version: "0.4.6"
tag: "0.4.6"
requires:
  - Python
  - toolz
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