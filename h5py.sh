package: h5py
description: h5py Python package
version: "3.13.0"
tag: "3.13.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/h5py-3.13.0.tar.gz
requires:
  - Python
  - hdf5
  - setuptools
  - numpy
  - six
  - cython
  - pkg_config
  - pip
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################