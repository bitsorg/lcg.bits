package: autopep8
description: autopep8 Python package
version: "2.3.1"
tag: "2.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/autopep8-2.3.1.tar.gz
requires:
  - Python
  - setuptools
  - pycodestyle
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