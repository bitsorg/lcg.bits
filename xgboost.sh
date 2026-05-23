package: xgboost
description: XGBoost scalable distributed gradient boosting library
version: "2.1.3"
tag: "2.1.3"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################