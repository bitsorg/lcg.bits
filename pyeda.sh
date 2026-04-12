package: pyeda
description: pyeda Python package
version: "0.29.0"
tag: "0.29.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyeda-0.29.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - pyeda-0.29.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################