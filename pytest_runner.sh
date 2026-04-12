package: pytest_runner
description: pytest_runner Python package
version: "6.0.1"
tag: "6.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pytest_runner-6.0.1.tar.gz
requires:
  - Python
  - setuptools
  - setuptools_scm
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