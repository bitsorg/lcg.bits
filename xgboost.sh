package: xgboost
description: xgboost Python package
version: "2.1.3"
tag: "2.1.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xgboost-2.1.3.tar.gz
requires:
  - Python
  - numpy
  - scipy
  - setuptools
  # optional:
  # - spark
  # - scikitlearn
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