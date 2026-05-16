package: pyerfa
description: pyERFA Python bindings for ERFA astronomical library
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
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################