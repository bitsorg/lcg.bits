package: astunparse
description: astunparse Python AST unparsing library
version: "1.6.3"
tag: "1.6.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/astunparse-1.6.3.tar.gz
requires:
  - Python
  - six
  - wheel
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