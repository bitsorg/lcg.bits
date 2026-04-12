package: oracledb
description: oracledb Python package
version: "3.4.2"
tag: "3.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/oracledb-3.4.2.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - oracle
  - cryptography
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