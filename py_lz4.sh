package: py_lz4
description: py_lz4 Python package
version: "4.4.5"
tag: "4.4.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/py_lz4-4.4.5.tar.gz
requires:
  - Python
  - setuptools
  - setuptools_scm
  - lz4
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