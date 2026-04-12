package: antlr4_python3_runtime
description: antlr4_python3_runtime Python package
version: "4.13.1"
tag: "4.13.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/antlr4-python3-runtime-4.13.1.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################