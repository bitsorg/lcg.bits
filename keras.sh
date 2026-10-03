package: keras
description: Keras deep learning API for Python
version: "3.14.0"
tag: "3.14.0"
requires:
  - Python
  - PyYAML
  - six
  - h5py
  - scipy
  - numpy
  - namex
  - optree
  - absl_py
  - ml_dtypes
  - rich
  - packaging
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