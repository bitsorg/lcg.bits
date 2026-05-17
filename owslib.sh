package: OWSLib
description: OWSLib Python package for OGC Web Services
version: "0.34.1"
tag: "0.34.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/OWSLib-0.34.1.tar.gz
requires:
  - Python
  - setuptools
  - lxml
  - python_dateutil
  - pytz
  - requests
  - pyproj
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################