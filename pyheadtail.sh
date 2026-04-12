package: PyHEADTAIL
description: PyHEADTAIL Python package
version: "1.16.4"
tag: "1.16.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/PyHEADTAIL-1.16.4.tar.gz
requires:
  - Python
  - numpy
  - cython
  - setuptools
  - h5py
  - scipy
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