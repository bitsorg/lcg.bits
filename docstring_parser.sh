package: docstring_parser
description: docstring-parser parse Python docstrings
version: "0.15"
tag: "0.15"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/docstring_parser-0.15.tar.gz
requires:
  - Python
  - pip
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