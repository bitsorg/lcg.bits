package: tensorflow_estimator
description: TensorFlow Estimator high-level TF model training API
version: "unknown"
tag: "unknown"
requires:
  - absl_py
  - six
  - numpy
  - wheel
  - Python
  - setuptools
  - pip
  - termcolor
  - astor
  - gast
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