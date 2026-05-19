package: keras
description: Keras deep learning API for Python
version: "3.11.3"
tag: "3.11.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/keras-3.11.3.tar.gz
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################