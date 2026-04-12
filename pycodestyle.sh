package: pycodestyle
description: pycodestyle Python package
version: "2.14.0"
tag: "2.14.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pycodestyle-2.14.0.tar.gz
requires:
  - Python
  - setuptools
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