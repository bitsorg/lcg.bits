package: tinycss2
description: tinycss2 low-level CSS parser for Python
version: "1.2.1"
tag: "1.2.1"
requires:
  - Python
  - webencodings
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