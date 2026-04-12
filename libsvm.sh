package: libsvm
description: libsvm Python package
version: "3.23"
tag: "3.23"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libsvm-3.23.tar.gz
requires:
  - Python
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