package: openpyxl
description: openpyxl Python package
version: "3.1.5"
tag: "3.1.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openpyxl-3.1.5.tar.gz
requires:
  - Python
  - setuptools
  - et_xmlfile
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