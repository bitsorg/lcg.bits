package: h5py
description: h5py Pythonic interface to HDF5 binary data format
version: "3.13.0"
tag: "3.13.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/h5py-3.13.0.tar.gz
requires:
  - Python
  - hdf5
  - numpy
  - six
  - cython
  - pkg_config
  - pip
  - executing
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
export HDF5_DIR="${HDF5_ROOT}"
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################