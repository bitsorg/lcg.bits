package: numdifftools
description: numdifftools Python package
version: "0.9.41"
tag: "0.9.41"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/numdifftools-0.9.41.tar.gz
requires:
  - Python
  - pip
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