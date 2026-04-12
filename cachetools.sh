package: cachetools
description: cachetools Python package
version: "5.5.1"
tag: "5.5.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cachetools-5.5.1.tar.gz
requires:
  - Python
  - setuptools
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