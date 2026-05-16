package: vector
description: vector Lorentz/spatial vector library for HEP in Python
version: "1.8.0"
tag: "1.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/vector-1.8.0.tar.gz
requires:
  - Python
  - pip
  - numpy
  - packaging
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