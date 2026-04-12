package: tensorflow_model_optimization
description: tensorflow_model_optimization Python package
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/model-optimization-unknown.tar.gz
requires:
  - Python
  - setuptools
  - six
  - numpy
  - dm_tree
  - absl_py
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