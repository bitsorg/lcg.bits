package: isort
description: isort Python utility to sort imports alphabetically
version: "5.12.0"
tag: "5.12.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/isort-5.12.0.tar.gz
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