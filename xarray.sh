package: xarray
description: xarray labeled multi-dimensional arrays for Python
version: "2025.4.0"
tag: "2025.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xarray-2025.4.0.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - packaging
  - pandas
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################