package: sqlparse
description: sqlparse Python package
version: "0.5.3"
tag: "0.5.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sqlparse-0.5.3.tar.gz
requires:
  - Python
  - pip
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