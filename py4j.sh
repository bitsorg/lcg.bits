package: py4j
description: py4j Python package
version: "0.10.9.9"
tag: "0.10.9.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/py4j-0.10.9.9.tar.gz
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