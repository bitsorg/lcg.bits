package: pathable
description: pathable Python package
version: "0.4.4"
tag: "0.4.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pathable-0.4.4.tar.gz
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