package: tzdata
description: tzdata Python package
version: "2024.1"
tag: "2024.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tzdata-2024.1.tar.gz
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