package: tensorflow_estimator
description: TensorFlow Estimator high-level TF model training API
version: "unknown"
tag: "unknown"
requires:
  - absl_py
  - six
  - mock
  - numpy
  - wheel
  - Python
  - setuptools
  - funcsigs
  - pip
  - termcolor
  - astor
  - gast
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