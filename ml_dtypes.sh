package: ml_dtypes
description: ml_dtypes Python package
version: "0.5.1"
tag: "0.5.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ml_dtypes-0.5.1.tar.gz
requires:
  - Python
  - pip
  - numpy
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