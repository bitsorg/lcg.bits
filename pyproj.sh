package: pyproj
description: pyproj Python package
version: "3.7.1"
tag: "3.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyproj-3.7.1.tar.gz
requires:
  - Python
  - setuptools
  - proj
  - cython
  - certifi
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