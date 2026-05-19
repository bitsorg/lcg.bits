package: pyparsing
description: pyparsing Python parsing module
version: "3.2.5"
tag: "3.2.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyparsing-3.2.5.tar.gz
requires:
  - Python
  - pip
  - railroad_diagrams
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