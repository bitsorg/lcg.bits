package: vector
description: vector Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################