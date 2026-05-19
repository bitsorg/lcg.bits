package: gast
description: GAST generic Python AST representation
version: "0.6.0"
tag: "0.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gast-0.6.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################