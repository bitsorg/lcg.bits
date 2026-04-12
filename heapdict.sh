package: HeapDict
description: HeapDict Python package
version: "1.0.1"
tag: "1.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/HeapDict-1.0.1.tar.gz
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