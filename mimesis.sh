package: mimesis
description: Mimesis fake data generator for Python
version: "14.0.0"
tag: "14.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mimesis-14.0.0.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################