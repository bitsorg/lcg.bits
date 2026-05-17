package: pytables
description: PyTables HDF5 tables package for managing large datasets
version: "3.10.2"
tag: "3.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tables-3.10.2.tar.gz
requires:
  - Python
  - numpy
  - numexpr
  - hdf5
  - xz
  - cython
  - pip
  - setuptools
  - blosc
  - blosc2
  - packaging
  - typing_extensions
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
export HDF5_DIR="${HDF5_ROOT}"
export BLOSC_DIR="${BLOSC_ROOT}"
export BLOSC2_DIR="${BLOSC2_ROOT}"
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################