package: flake8
description: flake8 Python package
version: "7.3.0"
tag: "7.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/flake8-7.3.0.tar.gz
requires:
  - Python
  - setuptools
  - entrypoints
  - pyflakes
  - pycodestyle
  - mccabe
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