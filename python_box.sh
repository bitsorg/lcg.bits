package: python_box
description: python-box Python dictionaries with advanced dot notation
version: "7.2.0"
tag: "7.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/python-box-7.2.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################