package: xlrd
description: xlrd library for reading Excel (.xls) files
version: "2.0.1"
tag: "2.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xlrd-2.0.1.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################