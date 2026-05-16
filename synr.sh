package: synr
description: synr stable AST representation for Python (TVM)
version: "0.5.0"
tag: "0.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/synr-0.5.0.tar.gz
requires:
  - Python
  - setuptools
  - attrs
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################