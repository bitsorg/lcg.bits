package: antlr4_python3_runtime
description: ANTLR4 runtime library for Python 3
version: "4.13.1"
tag: "4.13.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/antlr4-python3-runtime-4.13.1.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################