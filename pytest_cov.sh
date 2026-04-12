package: pytest_cov
description: pytest_cov Python package
version: "7.0.0"
tag: "7.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pytest_cov-7.0.0.tar.gz
requires:
  - Python
  - setuptools
  - pytest
  - coverage
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