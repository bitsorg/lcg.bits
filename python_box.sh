package: python_box
description: python_box Python package
version: "7.2.0"
tag: "7.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/python-box-7.2.0.tar.gz
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