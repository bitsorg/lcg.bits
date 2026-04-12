package: python_vxi11
description: python_vxi11 Python package
version: "0.9"
tag: "0.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/python-vxi11-0.9.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - python_vxi11-0.9.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################