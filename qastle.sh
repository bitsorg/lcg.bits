package: qastle
description: qastle text-based query language for HEP data
version: "0.19.0"
tag: "0.19.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/qastle-0.19.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - lark
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