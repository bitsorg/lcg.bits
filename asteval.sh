package: asteval
description: asteval safe mathematical expression evaluator for Python
version: "0.9.31"
tag: "0.9.31"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/asteval-0.9.31.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################