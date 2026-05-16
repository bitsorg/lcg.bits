package: pyshp
description: pyshp read/write ESRI Shapefiles in pure Python
version: "2.3.1"
tag: "2.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyshp-2.3.1.tar.gz
requires:
  - setuptools
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################