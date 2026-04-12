package: coverage
description: coverage Python package
version: "7.13.5"
tag: "7.13.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/coverage-7.13.5.tar.gz
requires:
  - Python
  - setuptools
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