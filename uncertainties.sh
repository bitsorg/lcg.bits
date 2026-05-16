package: uncertainties
description: uncertainties Python package for error propagation
version: "3.2.3"
tag: "3.2.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/uncertainties-3.2.3.tar.gz
requires:
  - Python
  - setuptools
  - numpy
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