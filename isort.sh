package: isort
description: isort Python package
version: "5.12.0"
tag: "5.12.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/isort-5.12.0.tar.gz
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