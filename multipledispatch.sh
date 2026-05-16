package: multipledispatch
description: multipledispatch multiple dispatch for Python functions
version: "1.0.0"
tag: "1.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/multipledispatch-1.0.0.tar.gz
requires:
  - Python
  - pip
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