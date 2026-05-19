package: autopep8
description: autopep8 automatic PEP 8 Python code formatter
version: "2.3.1"
tag: "2.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/autopep8-2.3.1.tar.gz
requires:
  - Python
  - pycodestyle
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