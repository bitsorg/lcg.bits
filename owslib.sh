package: OWSLib
description: OWSLib Python package
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