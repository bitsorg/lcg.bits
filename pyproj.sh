package: pyproj
description: pyproj Python interface to PROJ cartographic library
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
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################