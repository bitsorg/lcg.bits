package: scikitlearn
description: scikitlearn Python package
version: "1.8.0"
tag: "1.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/scikit-learn-1.8.0.tar.gz
requires:
  - Python
  - numpy
  - scipy
  - cython
  - joblib
  - pip
  - pyarrow
  # optional:
  # - threadpoolctl
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