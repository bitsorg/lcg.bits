package: qastle
description: qastle text-based query language for HEP data
version: "0.19.0"
tag: "0.19.0"
requires:
  - Python
  - lark
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################