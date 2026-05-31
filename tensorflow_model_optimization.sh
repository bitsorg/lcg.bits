package: tensorflow_model_optimization
description: TensorFlow Model Optimization toolkit
version: "0.8.0"
tag: "0.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/model-optimization-%(version)s.tar.gz
requires:
  - Python
  - six
  - numpy
  - dm_tree
  - absl_py
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - tensorflow_model_optimization-0.8.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################