package: scipy
description: SciPy scientific and technical computing library for Python
version: "1.17.1"
tag: "1.17.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/scipy-1.17.1.tar.gz
requires:
  - Python
  - numpy
  - pybind11
  - pythran
  - meson_python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
[ "$(uname -m)" = "aarch64" ] && export OPENBLAS_NUM_THREADS=1
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################