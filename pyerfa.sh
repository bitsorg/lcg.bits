package: pyerfa
description: pyerfa Python package
version: "2.0.1.4"
tag: "2.0.1.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyerfa-2.0.1.4.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - setuptools_scm
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