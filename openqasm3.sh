package: openqasm3
description: openqasm3 OpenQASM 3 AST and parsing library
version: "1.0.1"
tag: "1.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openqasm3-1.0.1.tar.gz
requires:
  - Python
  - pip
  - antlr4_python3_runtime
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################