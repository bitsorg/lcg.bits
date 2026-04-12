package: h11
description: h11 Python package
version: "0.16.0"
tag: "0.16.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/h11-0.16.0.tar.gz
requires:
  - Python
  - pip
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