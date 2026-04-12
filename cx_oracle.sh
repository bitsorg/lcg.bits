package: cx_oracle
description: cx_oracle Python package
version: "8.3.0"
tag: "8.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cx_Oracle-8.3.0.tar.gz
requires:
  - Python
  - setuptools
  - oracle
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