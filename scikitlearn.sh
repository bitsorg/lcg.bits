package: scikitlearn
description: scikit-learn machine learning library for Python
version: "1.9.0"
source: https://github.com/scikit-learn/scikit-learn
tag: "%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/scikit-learn-1.9.0.tar.gz
requires:
  - Python
  - numpy
  - scipy
  - cython
  - joblib
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
# meson runs a Cython sanity check that #includes Python.h before it resolves
# the Python dependency, so Python's include dir is not on the search path. Put
# CPython's versioned header dir (include/python<maj.min>) on CPATH. Per-recipe
# stopgap until Python advertises this on CPATH for all consumers.
_pyabi="${PYTHON_ROOT}/include/python${PYTHON_MAJOR_MINOR}"
[ -d "${_pyabi}" ] && export CPATH="${_pyabi}${CPATH:+:${CPATH}}"
unset _pyabi
##############################
