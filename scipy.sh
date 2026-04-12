package: scipy
description: scipy Python package
version: "1.17.1"
tag: "1.17.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/scipy-1.17.1.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - pip
  - pybind11
  - pythran
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