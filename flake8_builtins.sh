package: flake8_builtins
description: flake8_builtins Python package
version: "3.1.0"
tag: "3.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/flake8_builtins-3.1.0.tar.gz
requires:
  - Python
  - setuptools
  - flake8
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