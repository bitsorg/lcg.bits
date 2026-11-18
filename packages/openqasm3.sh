package: openqasm3
description: openqasm3 OpenQASM 3 AST and parsing library
version: "1.0.1"
tag: "1.0.1"
requires:
  - Python
  - antlr4_python3_runtime
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