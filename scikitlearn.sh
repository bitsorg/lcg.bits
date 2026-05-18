package: scikitlearn
description: scikit-learn machine learning library for Python
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
  - meson_python
  # optional:
  # - threadpoolctl
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
export ATLAS=None
[ "$(uname -s)" = "Darwin" ] && export SKLEARN_NO_OPENMP=1
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################