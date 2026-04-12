package: itkwasm
description: itkwasm Python package
version: "1.0b185"
tag: "1.0b185"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/itkwasm-1.0b185.tar.gz
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