package: keras
description: keras Python package
version: "3.11.3"
tag: "3.11.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/keras-3.11.3.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - PyYAML
  - six
  - h5py
  - scipy
  - numpy
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