package: tensorflow_model_optimization
description: TensorFlow Model Optimization toolkit
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
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################