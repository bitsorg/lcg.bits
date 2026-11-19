package: astunparse
description: astunparse Python AST unparsing library
version: "1.6.3"
tag: "1.6.3"
requires:
  - Python
  - six
  - wheel
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