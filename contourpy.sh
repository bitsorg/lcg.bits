package: contourpy
description: contourpy Python package
version: "1.0.7"
tag: "1.0.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/contourpy-1.0.7.tar.gz
requires:
  - Python
  - pip
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