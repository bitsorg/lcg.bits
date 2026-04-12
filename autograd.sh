package: autograd
description: autograd Python package
version: "1.7.0"
tag: "1.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/autograd-v1.7.0.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - numpy
  - scipy
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