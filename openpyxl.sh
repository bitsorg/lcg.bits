package: openpyxl
description: openpyxl Python library to read/write Excel 2010+ files
version: "3.1.5"
tag: "3.1.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openpyxl-3.1.5.tar.gz
requires:
  - Python
  - setuptools
  - et_xmlfile
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