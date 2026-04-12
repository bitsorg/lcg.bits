package: pysimdjson
description: pysimdjson Python package
version: "7.0.1"
tag: "7.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pysimdjson-7.0.1.tar.gz
requires:
  - Python
  - setuptools
  - pybind11
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