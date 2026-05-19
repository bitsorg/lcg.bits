package: xgboost
description: XGBoost scalable distributed gradient boosting library
version: "2.1.3"
tag: "2.1.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xgboost-2.1.3.tar.gz
requires:
  - Python
  - numpy
  - scipy
  # optional:
  # - spark
  # - scikitlearn
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################