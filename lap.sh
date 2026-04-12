package: lap
description: lap Python package
version: "0.5.12"
tag: "0.5.12"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lap-0.5.12.tar.gz
requires:
  - setuptools
  - cython
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