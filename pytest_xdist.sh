package: pytest_xdist
description: pytest_xdist Python package
version: "3.8.0"
tag: "3.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pytest_xdist-3.8.0.tar.gz
requires:
  - Python
  - pip
  - pytest
  - execnet
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