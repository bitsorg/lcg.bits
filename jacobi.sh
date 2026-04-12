package: jacobi
description: jacobi Python package
version: "0.9.2"
tag: "0.9.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jacobi-0.9.2.tar.gz
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