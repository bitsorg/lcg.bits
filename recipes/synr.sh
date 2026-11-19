package: synr
description: synr stable AST representation for Python (TVM)
version: "0.5.0"
tag: "0.5.0"
requires:
  - Python
  - attrs
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