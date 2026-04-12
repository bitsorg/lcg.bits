package: pybind11
description: pybind11 Python package
version: "2.11.1"
tag: "2.11.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pybind11-2.11.1.tar.gz
requires:
  - Python
  - setuptools
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